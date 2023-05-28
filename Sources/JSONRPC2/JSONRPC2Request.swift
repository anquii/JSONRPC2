import Foundation

public struct JSONRPC2Request: Encodable {
    public let jsonrpc = "2.0"
    public let method: String
    public let params: Encodable?
    public let id = UUID().uuidString

    public init(method: String, params: Encodable? = nil) {
        self.method = method
        self.params = params
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(jsonrpc, forKey: .jsonrpc)
        try container.encode(method, forKey: .method)
        if let params {
            try container.encode(params, forKey: .params)
        }
        try container.encode(id, forKey: .id)
    }

    private enum CodingKeys: String, CodingKey {
        case jsonrpc
        case method
        case params
        case id
    }
}
