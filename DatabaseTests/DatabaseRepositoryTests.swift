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
        let service = SavingServiceSpy(shouldThrow: false)
        let sut = makeSUT(service: service)
        let recipe = makeRecipe(name: "0")
        
        try! sut.addFavorite(recipe)
        
        XCTAssertNotNil(service.savedObject)
        XCTAssertTrue(service.savedObject is RealmRecipe)
        XCTAssertEqual((service.savedObject as! RealmRecipe).name, "0")
    }
    
    func testAddFavoriteDatabaseRepositoryErrorWhenDatabaseServiceProtocolFails() {
        let service = SavingServiceSpy(shouldThrow: true)
        let sut = makeSUT(service: service)
        let recipe = makeRecipe(name: "0")
        XCTAssertThrowsError((try sut.addFavorite(recipe)) as! DatabaseRepositoryError)
        XCTAssertNil(service.savedObject)
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
struct DummyError: Error { }

private class SavingServiceSpy: DatabaseServiceProtocol {
    var savedObject: Object?
    private var shouldThrow: Bool
    init(shouldThrow: Bool) {
        self.shouldThrow = shouldThrow
    }
    
    func save<T: Object>(_ object: T) throws {
        if shouldThrow {
            throw DummyError()
        } else {
            savedObject = object
        }
    }
    
    func read<T: Object>(_ objectType: T.Type) throws -> Results<T> {
        fatalError()
    }
    func delete<T: Object>(_ object: T) throws {
        fatalError()
    }
}
