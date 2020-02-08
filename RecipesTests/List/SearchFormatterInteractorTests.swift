//
//  SearchFormatterInteractorTests.swift
//  RecipesTests
//
//  Created by Aaron Huánuco on 09/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import Core
@testable import Recipes

final class SearchFormatterInteractorTests: XCTestCase {
    func testFormatFormatsSingleWord() {
        let sut = makeSUT()
        let formatted = sut.format("bread")
        XCTAssertEqual(formatted, "bread")
    }
    
    func testFormatFormatsTwoWordSpaceSeparated() {
        let sut = makeSUT()
        let formatted = sut.format("bread butter")
        XCTAssertEqual(formatted, "bread,butter")
    }
    
    func testFormatFormatsTwoWordSpaceSeparatedCapitalized() {
        let sut = makeSUT()
        let formatted = sut.format("Bread Butter")
        XCTAssertEqual(formatted, "bread,butter")
    }
    
    func testFormatFormatsTwoWordSpaceSeparatedUppercased() {
        let sut = makeSUT()
        let formatted = sut.format("BREAD BUTTER")
        XCTAssertEqual(formatted, "bread,butter")
    }
    
    func testFormatFormatsTwoWordSpaceSeparatedWithCommaAtTheEnd() {
        let sut = makeSUT()
        let formatted = sut.format("bread butter,")
        XCTAssertEqual(formatted, "bread,butter")
    }
    
    func testFormatFormatsTwoWordSpaceSeparatedWithNumbers() {
        let sut = makeSUT()
        let formatted = sut.format("bread butter 8")
        XCTAssertEqual(formatted, "bread,butter")
    }
    
    func testFormatFormatsEmptyString() {
        let sut = makeSUT()
        let formatted = sut.format("")
        XCTAssertEqual(formatted, "")
    }
    private func makeSUT() -> SearchFormatterInteractor {
        return SearchFormatterInteractor()
    }
}
