//
//  DatabaseRepository.swift
//  Database
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core
import RealmSwift

final class DatabaseRepository: DatabaseRepositoryProtocol {
    private let service: DatabaseServiceProtocol
    
    init(service: DatabaseServiceProtocol) {
        self.service = service
    }
    
    func deleteFavorite(_ recipe: Recipe) throws {
        let realmRecipe = RealmRecipe.make(recipe)
        do {
            try service.delete(realmRecipe)
        } catch {
            throw DatabaseRepositoryError.databaseError
        }
    }
    
    func addFavorite(_ recipe: Recipe) throws {
        let realmRecipe = RealmRecipe.make(recipe)
        do {
            try service.create(realmRecipe)
        } catch {
            throw DatabaseRepositoryError.databaseError
        }
    }
    
    func readFavorites() -> Result<[Recipe], DatabaseRepositoryError> {
        do {
            let storedRecipes = Array(try service.read(RealmRecipe.self))
            let recipes = storedRecipes.compactMap(RealmRecipe.makeRecipe)
            return .success(recipes)
        } catch {
            return .failure(.databaseError)
        }
    }
}
