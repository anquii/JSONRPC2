import XCTest
import JSONRPC2

final class JSONRPC2DecodableTests: XCTestCase {
    private let decoder = JSONDecoder()

    func testGivenEncodedError_WhenDecode_ThenError() throws {
        let encodedError = "{\"code\": 0, \"message\": \"testMessage\"}".data(using: .utf8)!
        let error = try decoder.decode(JSONRPC2Error.self, from: encodedError)
        XCTAssertEqual(error.code, 0)
        XCTAssertEqual(error.message, "testMessage")
    }

    func testGivenEncodedErrorWithData_WhenDecode_ThenError() throws {
        let encodedError = "{\"code\": 0, \"message\": \"testMessage\", \"data\": 0}".data(using: .utf8)!
        let error = try decoder.decode(JSONRPC2ErrorWithData<Int>.self, from: encodedError)
        XCTAssertEqual(error.code, 0)
        XCTAssertEqual(error.message, "testMessage")
        XCTAssertEqual(error.data, 0)
    }

    func testGivenEncodedResponse_WithResult_WhenDecode_ThenResponse() throws {
        let encodedResponse = "{\"jsonrpc\": \"2.0\", \"result\": \"testResult\", \"id\": \"testID\"}".data(using: .utf8)!
        let response = try decoder.decode(JSONRPC2Response<String, JSONRPC2Error>.self, from: encodedResponse)
        XCTAssertEqual(response.jsonrpc, "2.0")
        XCTAssertEqual(response.result, "testResult")
        XCTAssertEqual(response.id, "testID")
        XCTAssertNil(response.error)
    }

    func testGivenEncodedResponse_WithError_WhenDecode_ThenResponse() throws {
        let encodedResponse =
            "{\"jsonrpc\": \"2.0\", \"error\": {\"code\": 0, \"message\": \"testMessage\"}, \"id\": \"testID\"}".data(using: .utf8)!
        let response = try decoder.decode(JSONRPC2Response<String, JSONRPC2Error>.self, from: encodedResponse)
        XCTAssertEqual(response.jsonrpc, "2.0")
        XCTAssertEqual(response.error?.code, 0)
        XCTAssertEqual(response.error?.message, "testMessage")
        XCTAssertEqual(response.id, "testID")
        XCTAssertNil(response.result)
    }

    func testGivenEncodedResponses_WhenDecode_ThenResponses() throws {
        let encodedResponses = """
            [
                {"jsonrpc": "2.0", "result": "testResult", "id": "testID"},
                {"jsonrpc": "2.0", "error": {"code": 0, "message": "testMessage"}, "id": "testID"}
            ]
        """.data(using: .utf8)!
        let response = try decoder.decode([JSONRPC2Response<String, JSONRPC2Error>].self, from: encodedResponses)
        XCTAssertEqual(response[0].jsonrpc, "2.0")
        XCTAssertEqual(response[0].result, "testResult")
        XCTAssertEqual(response[0].id, "testID")
        XCTAssertNil(response[0].error)
        XCTAssertEqual(response[1].jsonrpc, "2.0")
        XCTAssertEqual(response[1].error?.code, 0)
        XCTAssertEqual(response[1].error?.message, "testMessage")
        XCTAssertEqual(response[1].id, "testID")
        XCTAssertNil(response[1].result)
    }
}
