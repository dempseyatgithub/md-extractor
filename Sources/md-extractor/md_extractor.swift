// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

@main
struct md_extractor: AsyncParsableCommand {
    @Argument var filenames: [String]
    
    mutating func run() async throws {
        for filename in filenames {
            print(filename)
        }

//        let fileURL = URL(fileURLWithPath: proposalPath)
//        let proposalListing = try FileManager.default.contentsOfDirectory(at: fileURL, includingPropertiesForKeys: nil)
//        for url in proposalListing {
//            print(url.lastPathComponent)
//        }
        
        print()
        print("--")
        print()
        
//        let previousResults = try await PreviousResultsFetcher.fetchPreviousResults()
//        print(previousResults)

    }
    
    static func logString() -> String { "logString" }
}
