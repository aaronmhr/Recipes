//
//  DatabaseRepositoryProtocol.swift
//  Core
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

public protocol DatabaseRepositoryProtocol {
    func deleteFavorite(_ recipe: Recipe) throws
    func addFavorite(_ recipe: Recipe) throws
    func readFavorites() -> Result<[Recipe], DatabaseRepositoryError>
}

public enum DatabaseRepositoryError: Error {
    case databaseError
}
