//
//  RecipeResponse.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentResponseModel = try? newJSONDecoder().decode(CurrentResponseModel.self, from: jsonData)

// MARK: - ResponseModel
struct ResponseModel: Decodable {
    let title: String?
    let version: Double?
    let href: String?
    let results: [RecipeResponse]?
}

// MARK: - Result
struct RecipeResponse: Decodable {
    let title: String?
    let href: String?
    let ingredients: String?
    let thumbnail: String?
}

extension RecipeResponse {
    static func makeRecipe(_ response: RecipeResponse) -> Recipe? {
        guard let title = response.title,
            let ingredients = response.ingredients,
            let url = URL(string: response.href ?? ""),
            let thumbnail = URL(string: response.href ?? "") else {
                return nil
        }
        return Recipe(title: title, ingredients: ingredients, url: url, thumbnail: thumbnail)
    }
}
