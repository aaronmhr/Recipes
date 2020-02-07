//
//  DetailProtocols.swift
//  Recipies
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

protocol DetailInteractorProtocol {
    var title: String { get }
    var urlRequest: URLRequest { get }
}

protocol DetailRouterProtocol {
    func goBack(animated: Bool)
}

protocol DetailPresenterProtocol {
    func viewDidLoad()
}

protocol DetailViewProtocol: class {
    func setPageTitle(_ title: String)
    func startLoading(urlRequest: URLRequest)
}
