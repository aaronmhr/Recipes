//
//  DatabaseRepositoryTests.swift
//  DatabaseTests
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import Core
import RealmSwift
@testable import Database

class DatabaseRepositoryTests: XCTestCase {
    
    func testAddFavoriteSavesRealmRecipeWhenRecipeIsGiven() {
        let service = SavingServiceSpy()
        let sut = makeSUT(service: service)
        let recipe = makeRecipe(name: "0")
        
        try! sut.addFavorite(recipe)
        
        XCTAssertNotNil(service.savedObject)
    }

    private func makeSUT(service: DatabaseServiceProtocol) -> DatabaseRepository {
        let repository = DatabaseRepository(service: service)
        return repository
    }
    
    private func makeRecipe(name: String) -> Recipe {
        return Recipe(name: name, ingredients: "\(name), \(name), \(name)", url: Constants.url, thumbnail: Constants.url)
    }
    
    private enum Constants {
        static let url = URL(string: "https://a-url.com")!
    }
}

private class SavingServiceSpy: DatabaseServiceProtocol {
    var savedObject: Object?
    
    func save<T: Object>(_ object: T) throws {
        savedObject = object
    }
    
    func read<T: Object>(_ objectType: T.Type) throws -> Results<T> {
        fatalError()
    }
    func delete<T: Object>(_ object: T) throws {
        fatalError()
    }
}
