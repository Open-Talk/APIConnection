import XCTest
@testable import APIConnection

final class APIConnectionTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(APIConnection().text, "Hello, World!")
    }
}
