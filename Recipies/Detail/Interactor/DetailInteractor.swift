//
//  DetailInteractor.swift
//  Recipies
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import Foundation

final class DetailInteractor {
    let url: URL
    let title: String
    
    init(title: String, url: URL) {
        self.url = url
        self.title = title
    }
}

extension DetailInteractor: DetailInteractorProtocol {
    var urlRequest: URLRequest {
        return URLRequest(url: url, timeoutInterval: 5.0)
    }
}
