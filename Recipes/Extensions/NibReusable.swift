//
//  NibReusable.swift
//  Recipes
//
//  Created by Aaron Huánuco on 06/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibReusable: Reusable {
    static var nib: UINib { get }
}

extension NibReusable {
    static var nib:  UINib {
        return UINib(nibName: reuseIdentifier, bundle: Bundle(for: self))
    }
}

extension UICollectionView {
    final func register<T: UICollectionViewCell & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue reusable cell with identifier '\(T.reuseIdentifier)'.")
        }
        return cell
    }
}

extension UITableView {
    final func register<T: UITableViewCell & NibReusable>(cellType: T.Type) {
        register(cellType.nib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    
    final func dequeueReusableCell<T: UITableViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Failed to dequeue reusable cell with identifier '\(T.reuseIdentifier)'.")
        }
        return cell
    }
}
