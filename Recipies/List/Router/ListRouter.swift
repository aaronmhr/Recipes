//
//  ListRouter.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class ListRouter: StoryboardInstantiator {
    weak var view: ListViewController!

    init(view: ListViewController) {
        self.view = view
    }

    static func assembleModule() -> UIViewController {
        let viewController = defaultViewController(for: ListViewController.self)
        let router = ListRouter(view: ListViewController())

        let interactor = ListInteractor()
        let presenter = ListPresenter(withView: viewController, interactor: interactor, router: router)

        viewController.presenter = presenter

        return viewController
    }
}

extension ListRouter: ListRouterProtocol {

}
