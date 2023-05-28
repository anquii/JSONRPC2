public struct JSONRPC2Batch: Encodable {
    public let items: [Encodable]

    public init(items: [Encodable]) {
        self.items = items
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for item in items {
            try container.encode(item)
        }
    }
}
