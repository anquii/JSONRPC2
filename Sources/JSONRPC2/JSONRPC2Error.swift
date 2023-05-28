public struct JSONRPC2Error: Decodable {
    public let code: JSONRPC2ErrorCode
    public let message: String
}
