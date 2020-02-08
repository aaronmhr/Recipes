//
//  FavoritesPresenter.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

final class FavoritesPresenter {
    let router: FavoritesRouterProtocol
    let interactor: FavoritesInteractorProtocol
    weak var view: FavoritesViewProtocol!

    init(withView view: FavoritesViewProtocol, interactor: FavoritesInteractorProtocol, router: FavoritesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavoritesPresenter: FavoritesPresenterProtocol {
    func viewDidLoad() {
        dump(interactor.recipes)
    }
}
