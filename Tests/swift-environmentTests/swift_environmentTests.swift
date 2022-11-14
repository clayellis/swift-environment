import XCTest
@testable import swift_environment

final class swift_environmentTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_environment().text, "Hello, World!")
    }
}
