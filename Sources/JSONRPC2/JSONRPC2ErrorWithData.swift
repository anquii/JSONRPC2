public struct JSONRPC2ErrorWithData<T: Decodable>: Decodable {
    public let code: JSONRPC2ErrorCode
    public let message: String
    public let data: T
}
