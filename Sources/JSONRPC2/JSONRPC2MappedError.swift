public enum JSONRPC2MappedError {
    case invalidJSON
    case invalidRequest
    case methodNotFound
    case invalidParams
    case internalError
    case serverError

    public init?(code: Int) {
        switch code {
        case -32700:
            self = .invalidJSON
        case -32600:
            self = .invalidRequest
        case -32601:
            self = .methodNotFound
        case -32602:
            self = .invalidParams
        case -32603:
            self = .internalError
        case -32099...(-32000):
            self = .serverError
        default:
            return nil
        }
    }
}
