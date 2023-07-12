public struct JSONRPC2ErrorWithData<T: Decodable>: Decodable {
    public let code: Int
    public let message: String
    public let data: T
}
