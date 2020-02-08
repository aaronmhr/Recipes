//
//  RecipeTests.swift
//  RecipeTests
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import Core

class RecipeTests: XCTestCase {

    func testHasLactoseIsFalseByDefault() {
        let sut = Recipe(name: "", ingredients: "", url: Constants.url, thumbnail: Constants.url)
        XCTAssertFalse(sut.hasLactose)
    }
    
    func testHasLactoseIsTrueIfContainsMilkAsIngredient() {
        let sut = Recipe(name: "", ingredients: "milk, tea", url: Constants.url, thumbnail: Constants.url)
        XCTAssertTrue(sut.hasLactose)
    }
    
    func testHasLactoseIsTrueIfContainsCheeseAsIngredient() {
        let sut = Recipe(name: "", ingredients: "tea, cheese", url: Constants.url, thumbnail: Constants.url)
        XCTAssertTrue(sut.hasLactose)
    }
    
    func testHasLactoseIsTrueIfContainsMilkAndCheeseAsIngredients() {
        let sut = Recipe(name: "", ingredients: "cheese, milk", url: Constants.url, thumbnail: Constants.url)
        XCTAssertTrue(sut.hasLactose)
    }
    
    func testHasLactoseIsTrueIfContainsMilkAndCheeseAsIngredientsAndInNoOtherField() {
        let sut = Recipe(name: "milk, cheese", ingredients: "", url: Constants.milkURL, thumbnail: Constants.cheeseURL)
        XCTAssertFalse(sut.hasLactose)
    }
    
    private enum Constants {
        static let url = URL(string: "https://www.youtube.com")!
        static let milkURL = URL(string: "https://www.youtube.com")!
        static let cheeseURL = URL(string: "https://www.youtube.com")!
    }
}
