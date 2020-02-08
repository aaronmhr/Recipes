//
//  RealmService.swift
//  Database
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import RealmSwift

public final class RealmService {
    private let configuration: Realm.Configuration
    
    public init(configuration: Realm.Configuration = .defaultConfiguration) {
        self.configuration = configuration
    }
    
    private var realmResult: Result<Realm,RealmServiceError> {
        do {
            return try .success(Realm(configuration: configuration))
        } catch {
            return .failure(.nonAccessibleRealm)
        }
    }
    
    public func read<T: Object>(_ objectType: T.Type) throws -> Results<T> {
        switch realmResult {
        case .success(let realm):
            return realm.objects(objectType)
        case .failure(let error):
            throw error
        }
    }
    
    public func create<T: Object>(_ object: T) throws {
        switch realmResult {
        case .success(let realm):
            do {
                try realm.write {
                    realm.add(object)
                }
            } catch {
                throw RealmServiceError.creatingObjectError
            }
        case .failure(let error):
            throw error
        }
    }

    public func delete<T: Object>(_ type: T.Type) throws {
        switch realmResult {
        case .success(let realm):
            do {
                try realm.write {
                    let objects = realm.objects(type)
                    realm.delete(objects)
                }
            } catch {
                throw RealmServiceError.deletingObjectError
            }
        case .failure(let error):
            throw error
        }
    }
}
