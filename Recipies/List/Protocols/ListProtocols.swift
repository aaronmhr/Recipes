//
//  ListProtocols.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

protocol ListInteractorProtocol {
    var recipes: [Recipe] { get }
    func attemptNewSearch(for text: String, completion: @escaping (Result<[Recipe],RecipeError>) -> Void)
    func getMoreRecipes()
}

protocol SearchFormatterInteractorProtocol {
    func format(_ searchText: String) -> String
}

protocol ListRouterProtocol {
    func showRecipe(title: String, url: URL, animated: Bool)
    func showFavorites(animated: Bool)
}

protocol ListPresenterProtocol {
    func viewDidLoad()
    func attemptSearch(for text: String)
    func getMoreRecipes()
    func didSelectItemAt(_ index: Int)
    func favoritesDidTap()
}

protocol ListViewProtocol: class {
    var recipes: [RecipeViewModel] { get set }
    func setupScreen(title: String, searchPlaceholder: String)
}
