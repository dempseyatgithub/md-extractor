//
//  ExtractionTests.swift
//  md-extractor
//
//  Created by James Dempsey on 11/10/25.
//

import Testing
@testable import md_extractor

struct ExtractionTests {
    @Test func someKindOfTest() {
        let YES = true
        let NO = false
        #expect(YES != NO)
    }
    
    @Test func testLogString() {
        #expect(md_extractor.logString() == "logString")
    }
}

