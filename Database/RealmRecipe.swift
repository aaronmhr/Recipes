//
//  RealmRecipe.swift
//  Database
//
//  Created by Aaron Huánuco on 08/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import RealmSwift

final class RealmRecipe: Object {
    @objc dynamic var  name: String = ""
    @objc dynamic var  ingredients: String = ""
    @objc dynamic var  url: Data = Data()
    @objc dynamic var  thumbnail: Data = Data()
}
