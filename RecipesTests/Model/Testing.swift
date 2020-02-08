//
//  Testing.swift
//  RecipesTests
//
//  Created by Aaron Huánuco on 09/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

enum Testing {
    static func makeRecipe(name: String) -> Recipe {
        return Recipe(name: name, ingredients: "\(name), \(name), \(name)", url: Constants.url, thumbnail: Constants.url)
    }
    
    private enum Constants {
        static let url = URL(string: "https://a-url.com")!
    }
}
