//
//  ListInteractorTests.swift
//  RecipesTests
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import Core
@testable import Recipes

class ListInteractorTests: XCTestCase {
    func testInteractorHasNoRecipesOnInit() {
        let (sut, _) = makeSUT()
        XCTAssertTrue(sut.recipes.isEmpty)
    }
    
    func testAttemptNewSearchDoesNotIncrementTheStoredResults() {
        let (sut, repository) = makeSUT()
        sut.attemptNewSearch(for: "test", completion: {_ in })
        sut.attemptNewSearch(for: "test", completion: {_ in })
        sut.attemptNewSearch(for: "test", completion: {_ in })
        
        XCTAssertEqual(repository.text, "test")
        XCTAssertEqual(sut.recipes, [repository.recipe])
    }
    
    func testGetMoreRecipesAfterAttemptSearchStoresResults() {
        let (sut, repository) = makeSUT()
        sut.attemptNewSearch(for: "test", completion: {_ in })
        sut.getMoreRecipes()
        sut.getMoreRecipes()
        
        XCTAssertEqual(repository.text, "test")
        XCTAssertEqual(sut.recipes.count, 3)
    }
    
    func testAttemptNewSearchResetsSearch() {
        let (sut, repository) = makeSUT()
        sut.attemptNewSearch(for: "test1", completion: {_ in })
        sut.getMoreRecipes()
        sut.getMoreRecipes()
        sut.attemptNewSearch(for: "test2", completion: {_ in })
        
        XCTAssertEqual(repository.text, "test2")
        XCTAssertEqual(sut.recipes.count, 1)
    }
    
    func completionHandlerIsCalledAsManyTimesAsAttemptNewSearchOrGetMoreDataAreCalled() {
        var counter = 0
        let (sut, _) = makeSUT()
        sut.attemptNewSearch(for: "test1", completion: {_ in
            counter += 1
        })
        sut.getMoreRecipes()
        sut.attemptNewSearch(for: "test2", completion: {_ in })
        
        XCTAssertEqual(counter, 3)
    }
    
    private func makeSUT() -> (ListInteractor, RecipeRepositorySpy) {
        let repository = RecipeRepositorySpy(recipe: Testing.makeRecipe(name: "0"))
        return (ListInteractor(with: repository), repository)
    }
}

final class RecipeRepositorySpy: RecipeRepository {
    let recipe: Recipe
    var text: String?
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    func getRecipes(for text: String, page: Int, completion: @escaping (Result<[Recipe], RepositoryError>) -> Void) {
        self.text = text
        completion(.success([recipe]))
    }
}
