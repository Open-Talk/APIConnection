import XCTest
@testable import APIConnection

final class APIConnectionTests: XCTestCase {
    func testExample() async throws {
        let thing = APIConnection()

        print(try await thing.getResponse(prompt: promptFor(view: .Interview)))
    }
}
