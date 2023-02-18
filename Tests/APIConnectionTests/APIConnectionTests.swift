import XCTest
@testable import APIConnection

final class APIConnectionTests: XCTestCase {
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let thing = APIConnection()
        XCTAssertEqual(thing.text, "Hello, World!")

        print(getResponse("hello"))
    }
}
