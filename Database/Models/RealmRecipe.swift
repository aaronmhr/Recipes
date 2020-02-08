//
//  RealmRecipe.swift
//  Database
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core
import RealmSwift

final class RealmRecipe: Object {
    @objc dynamic var  name: String = ""
    @objc dynamic var  ingredients: String = ""
    @objc dynamic var  url: Data = Data()
    @objc dynamic var  thumbnail: Data = Data()
}

extension RealmRecipe {
    static func make(_ recipe: Recipe) -> RealmRecipe {
        let realmRecipe = RealmRecipe()
        realmRecipe.name = recipe.name
        realmRecipe.url = recipe.url.dataRepresentation
        realmRecipe.thumbnail = recipe.thumbnail.dataRepresentation
        return realmRecipe
    }
}

extension RealmRecipe {
    static func makeRecipe(_ recipe: RealmRecipe) -> Recipe? {
        guard let url = URL(dataRepresentation: recipe.url, relativeTo: nil),
            let thumbnail = URL(dataRepresentation: recipe.thumbnail, relativeTo: nil) else {
                return nil
        }
        return Recipe(name: recipe.name, ingredients: recipe.ingredients, url: url, thumbnail: thumbnail)
    }
}
