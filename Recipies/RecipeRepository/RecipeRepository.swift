//
//  RecipeRepository.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

protocol RecipeRepository {
    func getRecipies(for text: String, page: Int, completion: @escaping (Result<[Recipe],RepositoryError>) -> Void)
}

enum RepositoryError: Error {
    case fileReading
}
