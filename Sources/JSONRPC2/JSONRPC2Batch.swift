public struct JSONRPC2Batch: Encodable {
    public let requests: [JSONRPC2Request]

    public init(requests: [JSONRPC2Request]) {
        self.requests = requests
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for request in requests {
            try container.encode(request)
        }
    }
}
