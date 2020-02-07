//
//  DetailViewController.swift
//  Recipies
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
    var presenter: DetailPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailViewController: DetailViewProtocol {

}
