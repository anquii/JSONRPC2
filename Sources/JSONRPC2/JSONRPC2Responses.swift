public struct JSONRPC2Responses<T: Decodable>: Decodable {
    public let responses: [T]

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        responses = try container.decode([T].self)
    }
}
