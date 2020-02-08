//
//  Recipe.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

public struct Recipe {
    public let name: String
    public let ingredients: String
    public let url: URL
    public let thumbnail: URL
    
    public init(name: String, ingredients: String, url: URL, thumbnail: URL) {
        self.name = name
        self.ingredients = ingredients
        self.url = url
        self.thumbnail = thumbnail
    }
}

extension Recipe {
    public var hasLactose: Bool {
        return ingredients.lowercased().contains("milk") || ingredients.lowercased().contains("cheese")
    }
}

public enum RecipeError: Error {
    case invalid
}
