//
//  DetailRouter.swift
//  Recipes
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class DetailRouter: StoryboardInstantiator {
    weak var view: DetailViewController!

    init(withView view: DetailViewController) {
        self.view = view
    }

    static func assembleModule(title: String, url: URL) -> UIViewController {
        let viewController = defaultViewController(for: DetailViewController.self)
        let router = DetailRouter(withView: viewController)

        let interactor = DetailInteractor(title: title, url: url)
        let presenter = DetailPresenter(withView: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter

        return viewController
    }

}

extension DetailRouter: DetailRouterProtocol {
    func goBack(animated: Bool) {
        view.navigationController?.popViewController(animated: animated)
    }
}
