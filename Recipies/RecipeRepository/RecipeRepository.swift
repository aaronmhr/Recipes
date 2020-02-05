//
//  RecipeRepository.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

protocol RecipeRepository {
    func getRecipies(completion: @escaping (Result<[Recipe],RepositoryError>) -> Void)
}

enum RepositoryError: Error {
    case fileReading
}
