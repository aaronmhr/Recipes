//
//  Recipe.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

struct Recipe {
    let name: String
    let ingredients: String
    let url: URL
    let thumbnail: URL
}

extension Recipe {
    var hasLactose: Bool {
        return ingredients.lowercased().contains("milk") || ingredients.lowercased().contains("cheese")
    }
}

enum RecipeError: Error {
    case invalid
}
