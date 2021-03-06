//
//  ListPresenter.swift
//  Recipes
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

final class ListPresenter {
    let router: ListRouterProtocol
    let interactor: ListInteractorProtocol
    let formatterInteractor: SearchingFormatterInteractor
    let savingInteractor: FavoriteSavingInteractor
    weak var view: ListViewProtocol!

    init(withView view: ListViewProtocol, interactor: ListInteractorProtocol, formatterInteractor: SearchingFormatterInteractor, savingInteractor: FavoriteSavingInteractor, router: ListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.formatterInteractor = formatterInteractor
        self.savingInteractor = savingInteractor
        self.router = router
    }
}

extension ListPresenter: ListPresenterProtocol {
    func viewDidLoad() {
        view.setupScreen(title: Localizables.screenTitleKey, searchPlaceholder: Localizables.searchPlaceholderKey)
    }
    
    func attemptSearch(for text: String) {
        let formattedIngredients = formatterInteractor.format(text)
        interactor.attemptNewSearch(for: formattedIngredients, completion: { [weak self] result in
            switch result {
            case .success(let recipes):
                let viewModels = recipes.map(RecipeViewModel.make)
                self?.view.recipes = viewModels
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func getMoreRecipes() {
        interactor.getMoreRecipes()
    }
    
    func didSelectItemAt(_ index: Int) {
        guard interactor.recipes.indices.contains(index) else { return }
        let recipe = interactor.recipes[index]
        router.showRecipe(title: recipe.name, url: recipe.url, animated: true)
    }
    
    func favoritesDidTap() {
        router.showFavorites(animated: true)
    }
    
    func makeFavoriteAtIndex(_ index: Int) {
        guard interactor.recipes.indices.contains(index) else { return }
        savingInteractor.save(recipe: interactor.recipes[index])
    }
}

extension ListPresenter {
    private enum Localizables {
        static let screenTitleKey = "Recipes"
        static let searchPlaceholderKey = "Ingredients..."
    }
}
