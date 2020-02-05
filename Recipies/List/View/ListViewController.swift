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
    @IBOutlet private var collectionView: UICollectionView!
    private var timer: Timer?
    lazy var searchController: UISearchController = {
        let sb = UISearchController(searchResultsController: nil)
        return sb
    }()
    
    var recipes: [RecipeViewModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupCollctionView()
        presenter.viewDidLoad()
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setupCollctionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: RecipeCell.self)
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width, height: 250)
        }
    }
}

extension ListViewController: ListViewProtocol {
    func setupScreen(title: String, searchPlaceholder: String) {
        navigationItem.largeTitleDisplayMode = .always
        self.title = title
        searchController.searchBar.placeholder = searchPlaceholder
    }
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] timer in
            guard let self = self,
            let text = self.searchController.searchBar.text else { return }
            self.presenter.attemptSearch(for: text)
        })
    }
}

extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard indexPath.row >= (recipes.count - 2),
        let text = searchController.searchBar.text else { return }
        presenter.attemptSearch(for: text)
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecipeCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(with: recipes[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 0, bottom: 20, right: 0)
    }
}
