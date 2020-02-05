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
    let title: String
    let version: Double
    let href: String
    let results: [RecipeResponse]
}

// MARK: - Result
struct RecipeResponse: Decodable {
    let title: String
    let href: String
    let ingredients: String
    let thumbnail: String
}
