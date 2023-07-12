import XCTest
import JSONRPC2

final class JSONRPC2EncodableTests: XCTestCase {
    private let encoder = JSONEncoder()

    override func setUp() {
        encoder.outputFormatting = .sortedKeys
    }

    func testGivenRequest_With0Params_WhenEncode_ThenEqualVector() throws {
        let request = JSONRPC2Request(method: "testMethod", id: "testID")
        let encodedRequest = try encoder.encode(request)
        let expression = String(data: encodedRequest, encoding: .utf8)
        let vectorExpression = "{\"id\":\"testID\",\"jsonrpc\":\"2.0\",\"method\":\"testMethod\"}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenRequest_With1PositionalParam_WhenEncode_ThenEqualVector() throws {
        let request = JSONRPC2Request(method: "testMethod", params: [0], id: "testID")
        let encodedRequest = try encoder.encode(request)
        let expression = String(data: encodedRequest, encoding: .utf8)
        let vectorExpression = "{\"id\":\"testID\",\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":[0]}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenRequest_With2PositionalParams_WhenEncode_ThenEqualVector() throws {
        let request = JSONRPC2Request(method: "testMethod", params: [0, 1], id: "testID")
        let encodedRequest = try encoder.encode(request)
        let expression = String(data: encodedRequest, encoding: .utf8)
        let vectorExpression = "{\"id\":\"testID\",\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":[0,1]}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenRequest_With1NamedParam_WhenEncode_ThenEqualVector() throws {
        let request = JSONRPC2Request(method: "testMethod", params: ["testParam0": "0"], id: "testID")
        let encodedRequest = try encoder.encode(request)
        let expression = String(data: encodedRequest, encoding: .utf8)
        let vectorExpression = "{\"id\":\"testID\",\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":{\"testParam0\":\"0\"}}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenRequest_With2NamedParams_WhenEncode_ThenEqualVector() throws {
        let request = JSONRPC2Request(method: "testMethod", params: ["testParam0": "0", "testParam1": "1"], id: "testID")
        let encodedRequest = try encoder.encode(request)
        let expression = String(data: encodedRequest, encoding: .utf8)
        let vectorExpression =
            "{\"id\":\"testID\",\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":{\"testParam0\":\"0\",\"testParam1\":\"1\"}}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenNotification_With0Params_WhenEncode_ThenEqualVector() throws {
        let notification = JSONRPC2Notification(method: "testMethod")
        let encodedNotification = try encoder.encode(notification)
        let expression = String(data: encodedNotification, encoding: .utf8)
        let vectorExpression = "{\"jsonrpc\":\"2.0\",\"method\":\"testMethod\"}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenNotification_With1PositionalParam_WhenEncode_ThenEqualVector() throws {
        let notification = JSONRPC2Notification(method: "testMethod", params: [0])
        let encodedNotification = try encoder.encode(notification)
        let expression = String(data: encodedNotification, encoding: .utf8)
        let vectorExpression = "{\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":[0]}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenNotification_With2PositionalParams_WhenEncode_ThenEqualVector() throws {
        let notification = JSONRPC2Notification(method: "testMethod", params: [0, 1])
        let encodedNotification = try encoder.encode(notification)
        let expression = String(data: encodedNotification, encoding: .utf8)
        let vectorExpression = "{\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":[0,1]}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenNotification_With1NamedParam_WhenEncode_ThenEqualVector() throws {
        let notification = JSONRPC2Notification(method: "testMethod", params: ["testParam0": "0"])
        let encodedNotification = try encoder.encode(notification)
        let expression = String(data: encodedNotification, encoding: .utf8)
        let vectorExpression = "{\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":{\"testParam0\":\"0\"}}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenNotification_With2NamedParams_WhenEncode_ThenEqualVector() throws {
        let notification = JSONRPC2Notification(method: "testMethod", params: ["testParam0": "0", "testParam1": "1"])
        let encodedNotification = try encoder.encode(notification)
        let expression = String(data: encodedNotification, encoding: .utf8)
        let vectorExpression = "{\"jsonrpc\":\"2.0\",\"method\":\"testMethod\",\"params\":{\"testParam0\":\"0\",\"testParam1\":\"1\"}}"
        XCTAssertEqual(expression, vectorExpression)
    }

    func testGivenBatch_With2Items_WhenEncode_ThenEqualVector() throws {
        let batch = JSONRPC2Batch(items: [JSONRPC2Request(method: "testMethod", id: "testID"), JSONRPC2Notification(method: "testMethod")])
        let encodedBatch = try encoder.encode(batch)
        let expression = String(data: encodedBatch, encoding: .utf8)
        let vectorExpression =
            "[{\"id\":\"testID\",\"jsonrpc\":\"2.0\",\"method\":\"testMethod\"},{\"jsonrpc\":\"2.0\",\"method\":\"testMethod\"}]"
        XCTAssertEqual(expression, vectorExpression)
    }
}
