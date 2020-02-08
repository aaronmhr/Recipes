//
//  RealmServiceTests.swift
//  DatabaseTests
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import XCTest
import RealmSwift
@testable import Database

final class RealmServiceTests: XCTestCase {
    
    func testDatabaseIsEmptyWhenInstantiated() {
        let sut = makeSUT()
        XCTAssertTrue(try sut.read(RealmRecipe.self).isEmpty)
    }
    
    func testDatabaseServiceSavesObject() {
        let sut = makeSUT()
        let recipe = makeTestingRealmRecipe(number: 0)
        
        try! sut.save(recipe)
        
        XCTAssertEqual(try sut.read(RealmRecipe.self).first, recipe)
    }
    
    func testDatabaseServiceSavesEveryObject() {
        let sut = makeSUT()
        let recipe1 = makeTestingRealmRecipe(number: 0)
        let recipe2 = makeTestingRealmRecipe(number: 2)
        let recipe3 = makeTestingRealmRecipe(number: 3)
        
        try! sut.save(recipe1)
        try! sut.save(recipe2)
        try! sut.save(recipe3)
        
        XCTAssertEqual((try sut.read(RealmRecipe.self)).count, 3)
    }
    
    func testDatabaseServiceSavesEveryObjectThatIsHasNotTheSameName() {
        let sut = makeSUT()
        let recipe1 = makeTestingRealmRecipe(number: 0)
        let recipe2 = makeTestingRealmRecipe(number: 0)
        let recipe3 = makeTestingRealmRecipe(number: 0)
        
        try! sut.save(recipe1)
        try! sut.save(recipe2)
        try! sut.save(recipe3)
        
        XCTAssertEqual((try sut.read(RealmRecipe.self)).count, 1)
    }
    
    func testDatabaseServiceUpdatesRecipies() {
        let sut = makeSUT()
        let recipe = makeTestingRealmRecipe(number: 0)
        let recipeUpdated = makeSlightlyDifferentTestingRealmRecipe(number: 0, ingredients: "Tea")
        
        try! sut.save(recipe)
        try! sut.save(recipeUpdated)
        
        XCTAssertEqual(try! sut.read(RealmRecipe.self).count, 1)
        XCTAssertEqual(dump(try! sut.read(RealmRecipe.self).first?.ingredients), dump("Tea"))
    }
    
    func testDatabaseServiceDeletesObject() {
        let sut = makeSUT()
        let recipe = makeTestingRealmRecipe(number: 0)
        
        try! sut.save(recipe)
        try! sut.delete(recipe)
        
        XCTAssertEqual(try! sut.read(RealmRecipe.self).count, 0)
    }
    
    private func makeSUT(identifier: String = UUID().uuidString) -> RealmService {
        let configuration = Realm.Configuration(inMemoryIdentifier: identifier)
        return RealmService(configuration: configuration)
    }
    
    private enum Constants {
        static let url = URL(string: "https://a-url.com")!
        static let data = url.dataRepresentation
    }
    
    private func makeTestingRealmRecipe(number: Int) -> RealmRecipe {
        return .init(name: "\(number)", ingredients: "\(number), \(number), \(number)", url: Constants.data, thumbnail: Constants.data)
    }
    
    private func makeSlightlyDifferentTestingRealmRecipe(number: Int, ingredients: String) -> RealmRecipe {
        return .init(name: "\(number)", ingredients: ingredients, url: Constants.data, thumbnail: Constants.data)
    }
}

extension RealmRecipe {
    convenience init(name: String, ingredients: String, url: Data, thumbnail: Data) {
        self.init()
        self.name = name
        self.ingredients = ingredients
        self.url = url
        self.thumbnail = thumbnail
    }
}
