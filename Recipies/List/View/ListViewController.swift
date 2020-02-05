//
//  ListViewController.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    var presenter: ListPresenterProtocol!
    
    var recipes: [RecipeViewModel] = [] {
        didSet {
            dump(recipes)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension ListViewController: ListViewProtocol {
    func setupScreen(title: String, searchPlaceholder: String) {
        navigationItem.largeTitleDisplayMode = .always
        self.title = title
    }
}
