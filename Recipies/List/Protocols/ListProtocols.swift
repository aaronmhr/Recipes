//
//  ListProtocols.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

protocol ListInteractorProtocol {
    func getBeers(completion: @escaping (Result<[Recipe],RecipeError>) -> Void)
}

protocol ListRouterProtocol {
}

protocol ListPresenterProtocol {
    func viewDidLoad()
}

protocol ListViewProtocol: class {
    var recipes: [RecipeViewModel] { get set }
}
