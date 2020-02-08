//
//  SaveFavoriteInteractorTests.swift
//  RecipesTests
//
//  Created by Aaron Huánuco on 09/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import Core
@testable import Recipes

final class SaveFavoriteInteractorTests: XCTestCase {
    func testSave() {
        let recipe = Testing.makeRecipe(name: "0")
        let (sut, repo) = makeSUT()
        
        sut.save(recipe: recipe)
        
        XCTAssertEqual(repo.recipe, recipe)
    }
    
    func makeSUT() -> (SaveFavoriteInteractor, DatabaseRepositorySpy) {
        let repo = DatabaseRepositorySpy()
        return (SaveFavoriteInteractor(repository: repo), repo)
    }
    
    class DatabaseRepositorySpy: DatabaseRepositoryProtocol {
        var recipe: Recipe?
        
        func deleteFavorite(_ recipe: Recipe) throws { }
        
        func addFavorite(_ recipe: Recipe) throws {
            self.recipe = recipe
        }
        
        func readFavorites() -> Result<[Recipe], DatabaseRepositoryError> {
            return .failure(.databaseError)
        }
    }
}
