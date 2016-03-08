//
//  ViewController.swift
//  DocumentPickerDemo
//
//  Created by Nick Ager on 08/03/2016.
//  Copyright © 2016 RocketBox Ltd. All rights reserved.
//

import UIKit
import NADocumentPicker
import BrightFutures

class ViewController: UIViewController {

    @IBOutlet var filePickedLabel: UILabel!

    @IBAction func pickerButtonPressed(sender: UIButton) {
        let urlPickedfuture = NADocumentPicker.show(from: sender, parentViewController: self)
        
        urlPickedfuture.onSuccess { url in
            self.filePickedLabel.text = "URL: \(url)"
        }
    }

}

