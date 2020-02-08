//
//  FavoritesInteractor.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

final class FavoritesInteractor {
    let database: DatabaseRepositoryProtocol
    init(database: DatabaseRepositoryProtocol) {
        self.database = database
    }
}

extension FavoritesInteractor: FavoritesInteractorProtocol {
    var recipes: [Recipe] {
        switch database.readFavorites() {
        case .success(let recipes):
            return recipes
        case .failure:
            return []
        }
    }
}
