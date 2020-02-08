//
//  FavoritesViewController.swift
//  Recipies
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class FavoritesViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    var presenter: FavoritesPresenterProtocol!
    private var recipes: [RecipeViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: FavoriteCell.self)
    }
}

extension FavoritesViewController: FavoritesViewProtocol {
    func setTilte(_ title: String) {
        self.title = title
    }
    
    func setViewModels(_ viewModels: [RecipeViewModel]) {
        recipes = viewModels
        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            presenter.deleteFavoriteAtIndex(indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoriteCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: recipes[indexPath.row])
        return cell
    }
}
