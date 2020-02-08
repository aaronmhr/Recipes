//
//  FavoritesRouter.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class FavoritesRouter: StoryboardInstantiator {
    weak var view: FavoritesViewController!

    init(withView view: FavoritesViewController) {
        self.view = view
    }

    static func assembleModule() -> UIViewController {
        let viewController = defaultViewController(for: FavoritesViewController.self)
        let router = FavoritesRouter(withView: viewController)

        let interactor = FavoritesInteractor()
        let presenter = FavoritesPresenter(withView: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter

        return viewController
    }
}

extension FavoritesRouter: FavoritesRouterProtocol {

}
