//
//  FavoritesProtocols.swift
//  Recipes
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

protocol FavoritesInteractorProtocol {
    var recipes: [Recipe] { get }
    func deleteFavorite(at index: Int)
}

protocol FavoritesRouterProtocol {
}

protocol FavoritesPresenterProtocol {
    func viewDidLoad()
    func deleteFavoriteAtIndex(_ index: Int)
}

protocol FavoritesViewProtocol: class {
    func setTilte(_ title: String)
    func setViewModels(_ viewModels: [RecipeViewModel])
}
