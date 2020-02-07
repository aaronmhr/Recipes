//
//  RealmServiceError.swift
//  Database
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

public enum RealmServiceError: Error {
    case createError
    case deleteError
    case noObjectSavedError
}

extension RealmServiceError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .createError:
            return "Could not save on database"
        case .deleteError:
            return "Could not delete from database"
        case .noObjectSavedError:
            return "Could not find or read saved object"
        }
    }
}
