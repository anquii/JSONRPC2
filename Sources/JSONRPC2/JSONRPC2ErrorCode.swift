public enum JSONRPC2ErrorCode: Int, Decodable {
    case invalidJSON = -32700
    case invalidRequest = -32600
    case methodNotFound = -32601
    case invalidParams = -32602
    case internalError = -32603
}
