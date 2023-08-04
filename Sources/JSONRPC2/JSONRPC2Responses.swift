public struct JSONRPC2Responses<T: Decodable>: Decodable {
    public let responses: [T]
}
