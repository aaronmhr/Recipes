//
//  SearchFormatterInteractor.swift
//  Recipies
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

final class SearchFormatterInteractor: SearchFormatterInteractorProtocol {
    func format(_ searchText: String) -> String {
        let commaRemoved = searchText.replacingOccurrences(of: "[0-9/*+-]", with: " ", options: .regularExpression, range: nil)
        let spacesRemoved = commaRemoved.replacingOccurrences(of: "[\\s\n]+", with: ",", options: .regularExpression, range: nil)
        let deleteLastIfNeeded = spacesRemoved.last == "," ? String(spacesRemoved.dropLast()) : spacesRemoved
        return deleteLastIfNeeded.lowercased()
    }
}
