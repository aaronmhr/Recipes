//
//  ListInteractor.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

final class ListInteractor {
    let repository: RecipeRepository
    private var ingredients = ""
    private var page = 1
    private var isLastPage = false
    private var isAlreadyFetching = false
    private var recipes: [Recipe] = []
    
    private var completion: (Result<[Recipe],RecipeError>) -> Void = { _ in}
    
    init(with repository: RecipeRepository) {
        self.repository = repository
    }
    
    private var preparedText: (String) -> String = { searchText in
        let commaRemoved = searchText.replacingOccurrences(of: "[0-9/*+-]", with: " ", options: .regularExpression, range: nil)
        let spacesRemoved = commaRemoved.replacingOccurrences(of: "[\\s\n]+", with: ",", options: .regularExpression, range: nil)
        let deleteLastIfNeeded = spacesRemoved.last == "," ? String(spacesRemoved.dropLast()) : spacesRemoved
        return deleteLastIfNeeded.lowercased()
    }
}

extension ListInteractor: ListInteractorProtocol {
    private func resetSearch() {
        ingredients = ""
        page = 1
        isLastPage = false
        recipes = []
    }
    
    func attemptNewSearch(for text: String, completion: @escaping (Result<[Recipe],RecipeError>) -> Void) {
        resetSearch()
        self.completion = completion
        ingredients = preparedText(text)
        guard text.count >= 3 else { return }
        getMoreRecipes()
    }
    
    func getMoreRecipes() {
        guard !isLastPage else { return }
        isAlreadyFetching = true
        repository.getRecipies(for: ingredients, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let recipies):
                self.isLastPage = recipies.isEmpty
                self.recipes += recipies
                self.completion(.success(self.recipes))
                self.page += 1
            case .failure:
                self.completion(.failure(.invalid))
            }
            self.isAlreadyFetching = false
        }
    }
}
