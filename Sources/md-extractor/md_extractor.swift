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
        
        
        
        print(); print("BASE PATH: \(String(describing: md_extractor.rootDirectory))")
        print(); print("FILENAMES:")
        for filename in filenames {
            if filename.hasPrefix("proposals") && filename.hasSuffix(".md") {
                print(filename)
                let fullURL = md_extractor.rootDirectory!.appending(path: filename)
                print(fullURL)
                let string = try String(contentsOf: fullURL)
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
    
    static let rootDirectory: URL? = {
        if let commandPath = CommandLine.arguments.first {
            let commandURL = URL(filePath: commandPath)
            return commandURL.deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
        }
        return nil
    }()

}
