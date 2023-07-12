public struct JSONRPC2Response<R: Decodable, E: Decodable>: Decodable {
    public let jsonrpc: String
    public let result: R?
    public let error: E?
    public let id: String
}
