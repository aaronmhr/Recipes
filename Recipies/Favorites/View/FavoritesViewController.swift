//
//  FavoritesViewController.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {
    var presenter: FavoritesPresenterProtocol!
    var recipes: [RecipeViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FavoritesViewController: FavoritesViewProtocol {

}
