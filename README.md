# JSONRPC2

[![Platform](https://img.shields.io/badge/Platforms-macOS%20%7C%20iOS-blue)](#platforms)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-orange)](#swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/anquii/JSONRPC2/blob/main/LICENSE)

A [JSON-RPC 2.0](https://www.jsonrpc.org/specification) client implementation in Swift.

## Platforms

- macOS 12+
- iOS 14+

## Installation

### Swift Package Manager

Add the following line to your `Package.swift` file:
```swift
.package(url: "https://github.com/anquii/JSONRPC2.git", from: "0.1.0")
```
...or integrate with Xcode via `File -> Swift Packages -> Add Package Dependency...` using the URL of the repository.

## Usage

```swift
import JSONRPC2

let service = JSONRPC2Service(url: url, urlSession: urlSession)
let request = JSONRPC2Request(method: method, params: params)
let result = try await service.sendRequest(request) as Result<JSONRPC2Response<ResultType, JSONRPC2Error>, HTTPError>
```

## License

`JSONRPC2` is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for more information.

## Donations

If you've found this software useful, please consider making a small contribution to one of these crypto addresses:

```
XNAV: xNTYqoQDzsiB5Cff9Wpt65AgZxYkt1GFy7KwuDafqRU2bcAZqoZUW4Q9TZ9QRHSy8cPsM5ALkJasizJCmqSNP9CosxrF2RbKHuDz5uJVUBcKJfvnb3RZaWygr8Bhuqbpc3DsgfB3ayc
XMR: 49jzT7Amu9BCvc5q3PGiUzWXEBQTLQw68a2KvBFTMs7SHjeWgrSKgxs69ycFWQupyw9fpR6tdT8Hp5h3KksrBG9m4c8aXiG
BTC: bc1q7hehfmnq67x5k7vz0cnc75qyflkqtxe2avjkyw
ETH (ERC-20) & BNB (BEP-20): 0xe08e383B4042749dE5Df57d48c57A690DC322b8d
```
