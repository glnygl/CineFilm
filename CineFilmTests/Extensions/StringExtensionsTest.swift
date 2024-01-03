//
//  StringExtensionsTest.swift
//  CineFilmTests
//
//  Created by glnygl on 4.01.2024.
//

import XCTest
@testable import CineFilm

final class StringExtensionsTest: XCTestCase {

    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_formatDateString_shouldReturnFormattedString() {
        
        let dateString = "1994-04-01"
        let formattedDateString = dateString.formatDateString()
        XCTAssertEqual(formattedDateString, "1 Apr 1994")
        
    }
    
    func test_formatDateString_shouldReturnEmptyString() {
        let dateString = "01-04-1994"
        let formattedDateString = dateString.formatDateString()
        XCTAssertTrue(formattedDateString.isEmpty)
    }
}
