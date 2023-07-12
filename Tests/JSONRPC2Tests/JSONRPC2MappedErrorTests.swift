import XCTest
import JSONRPC2

final class JSONRPC2MappedErrorTests: XCTestCase {
    func testGivenErrorCode_InvalidJSON_WhenInit_ThenMappedError() {
        XCTAssertEqual(JSONRPC2MappedError(code: -32700), .invalidJSON)
    }

    func testGivenErrorCode_InvalidRequest_WhenInit_ThenMappedError() {
        XCTAssertEqual(JSONRPC2MappedError(code: -32600), .invalidRequest)
    }

    func testGivenErrorCode_MethodNotFound_WhenInit_ThenMappedError() {
        XCTAssertEqual(JSONRPC2MappedError(code: -32601), .methodNotFound)
    }

    func testGivenErrorCode_InvalidParams_WhenInit_ThenMappedError() {
        XCTAssertEqual(JSONRPC2MappedError(code: -32602), .invalidParams)
    }

    func testGivenErrorCode_InternalError_WhenInit_ThenMappedError() {
        XCTAssertEqual(JSONRPC2MappedError(code: -32603), .internalError)
    }

    func testGivenLowerBoundErrorCode_ServerError_WhenInit_ThenMappedError() {
        XCTAssertEqual(JSONRPC2MappedError(code: -32099), .serverError)
    }

    func testGivenUpperBoundErrorCode_ServerError_WhenInit_ThenMappedError() {
        XCTAssertEqual(JSONRPC2MappedError(code: -32000), .serverError)
    }

    func testGivenUnmappedErrorCode_JustOutsideServerErrorBounds_WhenInit_ThenNil() {
        XCTAssertNil(JSONRPC2MappedError(code: -32100))
        XCTAssertNil(JSONRPC2MappedError(code: -31999))
    }

    func testGivenUnmappedErrorCode_WhenInit_ThenNil() {
        XCTAssertNil(JSONRPC2MappedError(code: -32800))
    }
}
