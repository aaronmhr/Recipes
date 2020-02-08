//
//  RealmServiceError.swift
//  Database
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

public enum RealmServiceError: Error {
    case nonAccessibleRealm
    case creatingObjectError
    case deletingObjectError
    case notFoundObjectError
}

extension RealmServiceError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .nonAccessibleRealm:
            return "Could not access Realm"
        case .creatingObjectError:
            return "Could not save on database"
        case .deletingObjectError:
            return "Could not delete from database"
        case .notFoundObjectError:
            return "Could not find or read saved object"
        }
    }
}
