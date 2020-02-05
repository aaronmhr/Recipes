//
//  ListInteractor.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

final class ListInteractor {
    let repository: RecipeRepository
    
    init(with repository: RecipeRepository) {
        self.repository = repository
    }
}

extension ListInteractor: ListInteractorProtocol {
    func getBeers(completion: @escaping (Result<[Recipe],RecipeError>) -> Void) {
        repository.getRecipies { result in
            completion(result.mapError({ repositoryError -> RecipeError in
                return RecipeError.invalid
            }))
        }
    }
}
