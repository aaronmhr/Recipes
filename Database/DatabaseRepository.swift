//
//  DatabaseRepository.swift
//  Database
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core
import RealmSwift

public final class DatabaseRepository: DatabaseRepositoryProtocol {
    private let service: DatabaseServiceProtocol
    
    public init(service: DatabaseServiceProtocol) {
        self.service = service
    }
    
    public func deleteFavorite(_ recipe: Recipe) throws {
        do {
            let  savedRecipe = try service.read(RealmRecipe.self).filter("name == %@", recipe.name).first
            guard let realmRecipe = savedRecipe else { return }
            try service.delete(realmRecipe)
        } catch {
            throw DatabaseRepositoryError.databaseError
        }
    }
    
    public func addFavorite(_ recipe: Recipe) throws {
        do {
            let realmRecipe = RealmRecipe.make(with: recipe)
            try service.create(realmRecipe)
        } catch {
            throw DatabaseRepositoryError.databaseError
        }
    }
    
    public func readFavorites() -> Result<[Recipe], DatabaseRepositoryError> {
        do {
            let storedRecipes = Array(try service.read(RealmRecipe.self))
            let recipes = storedRecipes.compactMap(RealmRecipe.makeRecipe)
            return .success(recipes)
        } catch {
            return .failure(.databaseError)
        }
    }
}
