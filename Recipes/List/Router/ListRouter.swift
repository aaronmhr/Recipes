//
//  ListRouter.swift
//  Recipes
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit
import Database
import Networking

final class ListRouter: StoryboardInstantiator {
    weak var view: ListViewController!

    init(view: ListViewController) {
        self.view = view
    }

    static func assembleModule() -> UIViewController {
        let viewController = defaultViewController(for: ListViewController.self)
        let router = ListRouter(view: viewController)

        let repository = MockingRecipeRepository()
        
        let interactor = ListInteractor(with: repository)
        let formatterInteractor = SearchFormatterInteractor()
        let databaseService = RealmService()
        let databaseRepository = DatabaseRepository(service: databaseService)
        let savingFavoriteInteractor = SaveFavoriteInteractor(repository: databaseRepository)
        let presenter = ListPresenter(withView: viewController, interactor: interactor, formatterInteractor: formatterInteractor, savingInteractor: savingFavoriteInteractor, router: router)

        viewController.presenter = presenter

        return viewController
    }
}

extension ListRouter: ListRouterProtocol {
    func showRecipe(title: String, url: URL, animated: Bool) {
        let viewController = DetailRouter.assembleModule(title: title, url: url)
        view.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func showFavorites(animated: Bool) {
        let viewController = FavoritesRouter.assembleModule()
        let navigationController = UINavigationController(rootViewController: viewController)
        view.navigationController?.present(navigationController, animated: animated, completion: nil)
    }
}
