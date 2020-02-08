//
//  RecipeRepository.swift
//  Recipes
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

public protocol RecipeRepository {
    func getRecipes(for text: String, page: Int, completion: @escaping (Result<[Recipe],RepositoryError>) -> Void)
}

public enum RepositoryError: Error {
    case fileReading
}
