# NADocumentPicker

[![CocoaPods compatible](https://img.shields.io/cocoapods/v/MBProgressHUD.svg?style=flat)](https://cocoapods.org/pods/MBProgressHUD) [![License: MIT](https://img.shields.io/cocoapods/l/MBProgressHUD.svg?style=flat)](http://opensource.org/licenses/MIT)

`NADocumentPicker` encapsulates UIKit document picker UI:

![](http://nickager.com/images/blog/DocumentPicker/filepicker-combined.jpg)

## Usage

`NADocumentPicker.show(..)` returns a [`Future` ](https://github.com/Thomvis/BrightFutures#examples). Hooking into `onSuccess` provides the URL of the file choosen by the user:

```swift
@IBAction func pickerButtonPressed(sender: UIButton) {
    let urlPickedfuture = NADocumentPicker.show(from: sender, parentViewController: self)

    urlPickedfuture.onSuccess { url in
        print("URL: \(url)")
    }
}
```

You can try-out `NADocumentPicker` demo project by using the cocoapod `try` option as:

```
$ pod try NADocumentPicker
```

---

For more detail see [http://nickager.com/blog/2016/03/07/DocumentPicker](http://nickager.com/blog/2016/03/07/DocumentPicker)
