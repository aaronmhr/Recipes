//
//  MockingRecipeRepository.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Core

final class MockingRecipeRepository: RecipeRepository {
    func getRecipies(for text: String, page: Int, completion: @escaping (Result<[Recipe], RepositoryError>) -> Void) {
        do {
            let response: ResponseModel = try ResponseModel.readJSONFrom(from: "test" + "\(page)")
            let recipies = response.results?.compactMap(RecipeResponse.makeRecipe) ?? []
            completion(.success(recipies))
        } catch {
            completion(.failure(.fileReading))
        }
    }
}

private extension Decodable {
    static func readJSONFrom<T:Decodable>(from file: String, fileExtension: String="json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: file, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
