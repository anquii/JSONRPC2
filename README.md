# JSONRPC2

[![Platform](https://img.shields.io/badge/Platforms-macOS%20%7C%20iOS-blue)](#platforms)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-orange)](#swift-package-manager)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/anquii/JSONRPC2/blob/main/LICENSE)

A transport agnostic client implementation of [JSON-RPC 2.0](https://www.jsonrpc.org/specification) in Swift.

## Platforms
- macOS 10.15+
- iOS 13+

## Installation

### Swift Package Manager

Add the following line to your `Package.swift` file:
```swift
.package(url: "https://github.com/anquii/JSONRPC2.git", from: "1.0.0")
```
...or integrate with Xcode via `File -> Swift Packages -> Add Package Dependency...` using the URL of the repository.

## Usage

```swift
import JSONRPC2

let encoder = JSONEncoder()
let decoder = JSONDecoder()

let request = JSONRPC2Request(method: method, params: params)
let encodedRequest = try encoder.encode(request)
let decodedRequest = try decoder.decode(JSONRPC2Response<ResultType, JSONRPC2Error>.self, from: encodedRequest)

let notification = JSONRPC2Notification(method: method, params: params)
let encodedNotification = try encoder.encode(notification)
let decodedNotification = try decoder.decode(JSONRPC2Response<ResultType, JSONRPC2Error>.self, from: encodedNotification)

let batch = JSONRPC2Batch(items: [request, notification])
let encodedBatch = try encoder.encode(batch)
let decodedBatch = try decoder.decode(JSONRPC2Response<ResultType, JSONRPC2Error>.self, from: encodedBatch)
// or if your batch includes multiple requests: let decodedBatch = try decoder.decode([JSONRPC2Response<ResultType, JSONRPC2Error>].self, from: encodedBatch)
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
