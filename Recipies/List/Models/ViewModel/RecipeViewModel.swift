//
//  RecipeViewModel.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

struct RecipeViewModel {
    let name: String
    let ingredients: String
    let image: URL
    let button: String
    let hasLactose: String?
}

extension RecipeViewModel {
    static func make(_ recipe: Recipe) -> RecipeViewModel {
        let hasLactose: String? = recipe.hasLactose ? Localizables.hasLactoseKey : nil
        return RecipeViewModel(name: recipe.name, ingredients: recipe.ingredients, image: recipe.thumbnail, button: Localizables.favoriteButtonKey, hasLactose: hasLactose)
    }
    
    private enum Localizables {
        static let hasLactoseKey = "Has Lactose"
        static let favoriteButtonKey = "Make Favorite"
    }
}
