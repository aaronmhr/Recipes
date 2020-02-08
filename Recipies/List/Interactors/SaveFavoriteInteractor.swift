//
//  SaveFavoriteInteractor.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

final class SaveFavoriteInteractor: FavoriteSavingInteractor {
    let repository: DatabaseRepositoryProtocol
    
    init(repository: DatabaseRepositoryProtocol) {
        self.repository = repository
    }
    
    func save(recipe: Recipe) {
        try? repository.addFavorite(recipe)
    }
}
