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
        
        
        
        
        print(); print("FILENAMES:")
        for filename in filenames {
            if filename.hasPrefix("proposals") && filename.hasSuffix(".md") {
                print(filename)
                let relativeURL = URL(filePath: filename, relativeTo: md_extractor.processDirectory)
                let string = try String(contentsOf: relativeURL)
                print("String count: \(string.count)")
            }
        }
        print()

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
    
    static let processDirectory: URL? = {
        if let commandPath = CommandLine.arguments.first {
            let commandURL = URL(filePath: commandPath)
            return commandURL.deletingLastPathComponent()
        }
        return nil
    }()

}
