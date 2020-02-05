//
//  ListViewController.swift
//  Recipies
//
//  Created by Aaron Huánuco on 05/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    var presenter: ListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListViewController: ListViewProtocol {

}
