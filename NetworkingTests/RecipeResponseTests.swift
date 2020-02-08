//
//  RecipeResponseTests.swift
//  RecipeResponseTests
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import Core
@testable import Networking

class RecipeResponseTests: XCTestCase {
    func testRecipeResponseWithNoTitleCanNotBuildRecipe() {
        XCTAssertNil(
            makeRecipeFrom(title: nil,
                           ingredients: "",
                           href: "https://www.youtube.com",
                           thumbnail: "https://www.youtube.com")
        )
    }
    
    func testRecipeResponseWithNoIngredientseCanNotBuildRecipe() {
        XCTAssertNil(
            makeRecipeFrom(title: "",
                           ingredients: nil,
                           href: "https://www.youtube.com",
                           thumbnail: "https://www.youtube.com")
        )
    }
    
    func testRecipeResponseWithNoHREFCanNotBuildRecipe() {
        XCTAssertNil(
            makeRecipeFrom(title: "",
                           ingredients: "",
                           href: nil,
                           thumbnail: "https://www.youtube.com")
        )
    }
    
    func testRecipeResponseWithNoThumbnailCanNotBuildRecipe() {
        XCTAssertNil(
            makeRecipeFrom(title: "",
                           ingredients: "",
                           href: "https://www.youtube.com",
                           thumbnail: nil)
        )
    }
    
    func testRecipeResponseCanBuildRecipe() {
        XCTAssertNotNil(
            makeRecipeFrom(title: "",
                           ingredients: "",
                           href: "https://www.youtube.com",
                           thumbnail: "https://www.youtube.com")
        )
    }
    
    private func makeRecipeFrom(title: String?, ingredients: String?, href: String?, thumbnail: String?) -> Recipe? {
        let response = RecipeResponse(title: title, href: href, ingredients: ingredients, thumbnail: thumbnail)
        let recipe = RecipeResponse.makeRecipe(response)
        return recipe
    }
}
