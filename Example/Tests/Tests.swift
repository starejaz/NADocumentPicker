import UIKit
import XCTest
@testable import NADocumentPicker_Example
@testable import NADocumentPicker
import BrightFutures
import Result

class Tests: XCTestCase {

    func testMemoryLeaks() {
        let expectationTest = expectation(description: "Future will complete")
        let vc = UIViewController()
        weak var dp = NADocumentPicker(parentViewController: vc)

        if let dp = dp {
            dp.promise.future.onComplete { [weak dp] _ in
                XCTAssert(dp == nil, "Expect the instance of NADocumentPicker to have freed itself")
                expectationTest.fulfill()
            }
        }
        
        DispatchQueue.global().async {
            if let dp = dp {
                // simulate a failure on a background thread
                dp.promise.failure(NADocumentPickerErrors.noDocumentPicked.asAnyError())
            }
        }

        waitForExpectations(timeout: 10) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
