
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors

import Foundation

struct PreviousResultsFetcher {
    
    static let previousResultsURL = URL(string: "https://download.swift.org/swift-evolution/v1/evolution.json")!
    
    static func fetchPreviousResults() async throws -> String {
        let request = URLRequest(url: previousResultsURL, cachePolicy: .reloadIgnoringLocalCacheData)
        print("Fetching with URLRequest:\n\(request.verboseDescription)")
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return String(decoding: data, as: UTF8.self)
        } catch {
            print(error)
            throw error
        }
    }
}

// Customized verbose logging of a URLRequest
extension URLRequest {
    var verboseDescription: String {
        var logString = ""
        if let method = httpMethod {
            logString += method + " "
        }
        if let url = url {
            logString += String(describing: url) + "\n"
        }
        logString += "Timeout: \(timeoutInterval)\n"
        
        let cachePolicyString =  switch(cachePolicy) {
            case .useProtocolCachePolicy: "useProtocolCachePolicy"
            case .reloadIgnoringLocalCacheData: "reloadIgnoringLocalCacheData"
            case .reloadIgnoringLocalAndRemoteCacheData: "reloadIgnoringLocalAndRemoteCacheData"
            case .returnCacheDataElseLoad: "returnCacheDataElseLoad"
            case .returnCacheDataDontLoad: "returnCacheDataDontLoad"
            case .reloadRevalidatingCacheData: "reloadRevalidatingCacheData"
            default: "unknown cache policy"
        }
        logString += "Cache Policy: \(cachePolicyString)"

        if let headers = allHTTPHeaderFields {
            if !headers.isEmpty {
                logString += "\n"
                logString += "Headers:\n"
            }
            let lastIndex = headers.count - 1
            for (index, (key, value)) in headers.enumerated() {
                let logValue = (key == "Authorization") ? "Bearer ****" : value
                logString += "\t\(key): \(logValue)\(index == lastIndex ? "" : "\n")"
            }
        }
        return logString
    }
}
