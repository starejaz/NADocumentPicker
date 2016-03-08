//
//  NADocumentPicker.swift
//  Encapsulates UIKit document picker UI
//  iDiffView
//
//  "Why doesn't Dropbox support iOS's open dialog?" - see discussion here: https://www.dropboxforum.com/hc/en-us/community/posts/204836509-Why-doesn-t-Dropbox-support-iOS-s-open-dialog-
//
//  Created by Nick Ager on 25/01/2016.
//  Copyright © 2016 RocketBox Ltd. All rights reserved.
//

import UIKit
import MobileCoreServices
import BrightFutures
import NACommonUtils

public enum NADocumentPickerErrors: ErrorType {
    case NoDocumentPicked
}

public class NADocumentPicker : NSObject {
    private let parentViewController: UIViewController
    private var keepInMemory: NADocumentPicker?
    private let promise = Promise<NSURL, NADocumentPickerErrors>()

    public class func show(from view: UIView, parentViewController: UIViewController) -> Future<NSURL, NADocumentPickerErrors> {
        let instance = NADocumentPicker(parentViewController: parentViewController)
        return instance.showDocumentProviderMenu(from: view, parentViewController: parentViewController)
    }

    private init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init()

        keepInMemoryUntilComplete()
    }

    private func showDocumentProviderMenu(from view: UIView, parentViewController: UIViewController) -> Future<NSURL, NADocumentPickerErrors> {
        let activityOverlay = showActivityOverlayAddedTo(parentViewController.view)
        let documentProviderMenu = UIDocumentMenuViewController(documentTypes:[kUTTypePlainText as String], inMode: UIDocumentPickerMode.Open)
        documentProviderMenu.delegate = self
        if let popoverPresentationController = documentProviderMenu.popoverPresentationController {
            popoverPresentationController.sourceView = view
            popoverPresentationController.sourceRect = view.bounds
        }

        parentViewController.presentViewController(documentProviderMenu, animated: true, completion: {
            activityOverlay.removeFromSuperview()
            print("\n</layout-errors>\nhttp://openradar.appspot.com/19385063\n")
        })

        return promise.future
    }

    private func keepOurselvesInMemory() {
        keepInMemory = self
    }

    private func freeOurselvesFromMemory() {
        keepInMemory = nil
    }

    private func keepInMemoryUntilComplete() {
        keepOurselvesInMemory()
        self.promise.future.onComplete { [unowned self] _ in
            self.freeOurselvesFromMemory()
        }
    }
}

// MARK: UIDocumentMenuDelegate
extension NADocumentPicker : UIDocumentMenuDelegate {
    public func documentMenu(_: UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        let activityOverlay = showActivityOverlayAddedTo(parentViewController.view)
        self.parentViewController.presentViewController(documentPicker, animated: true, completion: {
            activityOverlay.removeFromSuperview()
        })
    }

    public func documentMenuWasCancelled(_: UIDocumentMenuViewController) {
        promise.failure(NADocumentPickerErrors.NoDocumentPicked)
    }
}

// MARK: UIDocumentPickerDelegate
extension NADocumentPicker : UIDocumentPickerDelegate {
    public func documentPicker(_: UIDocumentPickerViewController, didPickDocumentAtURL url: NSURL) {
        promise.success(url)
    }

    public func documentPickerWasCancelled(_: UIDocumentPickerViewController) {
        promise.failure(NADocumentPickerErrors.NoDocumentPicked)
    }
}
