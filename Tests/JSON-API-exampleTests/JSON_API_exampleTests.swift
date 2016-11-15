import XCTest
@testable import JSON_API_example

class JSON_API_exampleTests: XCTestCase {
    
    func testExample() {
        XCTAssertEqual("Hello, World!", "Hello, World!")
    }
    
    static var allTests : [(String, (JSON_API_exampleTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
