public struct JSONRPC2Error: Decodable {
    public let code: Int
    public let message: String
}
