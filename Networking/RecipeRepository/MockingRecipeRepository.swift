//
//  MockingRecipeRepository.swift
//  Recipes
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

public final class MockingRecipeRepository: RecipeRepository {
    public init () { }
    public func getRecipes(for text: String, page: Int, completion: @escaping (Result<[Recipe], RepositoryError>) -> Void) {
        do {
            let response: ResponseModel = try ResponseModel.readJSONFrom(from: "test" + "\(page)")
            let Recipes = response.results?.compactMap(RecipeResponse.makeRecipe) ?? []
            completion(.success(Recipes))
        } catch {
            completion(.failure(.fileReading))
        }
    }
}

private extension Decodable {
    static func readJSONFrom<T:Decodable>(from file: String, fileExtension: String="json", bundle: Bundle = Bundle(for: MockingRecipeRepository.self)) throws -> T {
        guard let url = bundle.url(forResource: file, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
