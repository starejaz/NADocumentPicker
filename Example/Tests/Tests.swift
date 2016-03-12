import UIKit
import XCTest
@testable import NADocumentPicker
import BrightFutures

class Tests: XCTestCase {
    
    func testMemoryLeaks() {
        let expectation = expectationWithDescription("Future will complete")
        let vc = UIViewController()
        weak var dp = NADocumentPicker(parentViewController: vc)
        
        if let dp = dp {
            dp.promise.future.onComplete { [weak dp] _ in
                XCTAssert(dp == nil, "Expect the instance of NADocumentPicker to have freed itself")
                expectation.fulfill()
            }

            future { [weak dp] in
                if let dp = dp {
                    // simulate a failure on a background thread
                    dp.promise.failure(NADocumentPickerErrors.NoDocumentPicked.asAnyError())
                }
            }
        }
        
        waitForExpectationsWithTimeout(10) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
