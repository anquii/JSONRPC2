public struct JSONRPC2ServerNotificationWithParams<T: Decodable>: Decodable {
    public let jsonrpc: String
    public let method: String
    public let params: T
}
