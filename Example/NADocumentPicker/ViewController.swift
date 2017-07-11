//
//  ViewController.swift
//  NADocumentPicker
//
//  Created by Nick Ager on 03/09/2016.
//  Copyright (c) 2016 Nick Ager. All rights reserved.
//

import UIKit
import NADocumentPicker
import BrightFutures

class ViewController: UIViewController {
    
    @IBOutlet var filePickedLabel: UILabel!
    
    @IBAction func pickerButtonPressed(_ sender: UIButton) {
        let urlPickedfuture = NADocumentPicker.show(from: sender, parentViewController: self)
        
        urlPickedfuture.onSuccess { url in
            self.filePickedLabel.text = "URL: \(url)"
        }
    }
    
}

