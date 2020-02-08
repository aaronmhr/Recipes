//
//  FavoritesProtocols.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

protocol FavoritesInteractorProtocol {
    var recipes: [Recipe] { get }
}

protocol FavoritesRouterProtocol {
}

protocol FavoritesPresenterProtocol {
    func viewDidLoad()
}

protocol FavoritesViewProtocol: class {
    var recipes: [RecipeViewModel] { get set }
}
