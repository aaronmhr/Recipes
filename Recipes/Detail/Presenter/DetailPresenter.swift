//
//  DetailPresenter.swift
//  Recipes
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

final class DetailPresenter {
    let router: DetailRouterProtocol
    let interactor: DetailInteractorProtocol
    weak var view: DetailViewProtocol!

    init(withView view: DetailViewProtocol, interactor: DetailInteractorProtocol, router: DetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    func viewDidLoad() {
        view.setPageTitle(interactor.title)
        view.startLoading(urlRequest: interactor.urlRequest)
    }
}
