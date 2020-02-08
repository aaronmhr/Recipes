//
//  DatabaseServiceRepository.swift
//  Database
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import RealmSwift

protocol DatabaseServiceProtocol {
    func read<T: Object>(_ objectType: T.Type) throws -> Results<T>
    func create<T: Object>(_ object: T) throws
    func delete<T: Object>(_ object: T) throws
}
