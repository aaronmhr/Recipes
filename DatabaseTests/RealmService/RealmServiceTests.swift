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
    private func makeSUT() -> RealmService {
        let configuration = Realm.Configuration(inMemoryIdentifier: "TEST")
        return RealmService(configuration: configuration)
    }
    
    private enum Constants {
        static let url = URL(string: "https://a-url.com")!
        static let data = url.dataRepresentation
        static let recipe = RealmRecipe(name: "Test1", ingredients: "1, 1, 1", url: data, thumbnail: data)
    }
}

private extension RealmRecipe {
    convenience init(name: String, ingredients: String, url: Data, thumbnail: Data) {
        self.init()
        self.name = name
        self.ingredients = ingredients
        self.url = url
        self.thumbnail = thumbnail
    }
}
