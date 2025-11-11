// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

@main
struct md_extractor: ParsableCommand {
    mutating func run() throws {
        print("Hello, world!")
    }
    
    static func logString() -> String { "lagString" }
}
