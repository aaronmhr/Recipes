//
//  ListPresenter.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

final class ListPresenter {
    let router: ListRouterProtocol
    let interactor: ListInteractorProtocol
    weak var view: ListViewProtocol!

    init(withView view: ListViewProtocol, interactor: ListInteractorProtocol, router: ListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: ListPresenterProtocol {
    func viewDidLoad() {
        view.setupScreen(title: Localizables.screenTitleKey, searchPlaceholder: Localizables.searchPlaceholderKey)
    }
    
    func attemptSearch() {
        interactor.getBeers(completion: { [weak self] result in
            switch result {
            case .success(let recipes):
                self?.view.recipes = recipes.map(RecipeViewModel.make)
            case .failure(let error):
                print(error)
                break
            }
        })
    }
}

extension ListPresenter {
    private enum Localizables {
        static let screenTitleKey = "Recipies"
        static let searchPlaceholderKey = "Ingredients..."
    }
}
