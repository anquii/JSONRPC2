public struct JSONRPC2Response<ResultType: Decodable, ErrorType: Decodable>: Decodable {
    public let jsonrpc: String
    public let result: ResultType?
    public let error: ErrorType?
    public let id: String
}
