//
//  DetailViewController.swift
//  Recipes
//
//  Created by Aaron Huánuco on 07/02/2020.
//  Copyright © 2020 Aaron Huánuco. All rights reserved.
//

import WebKit

final class DetailViewController: UIViewController, WKNavigationDelegate {
    var presenter: DetailPresenterProtocol!
    @IBOutlet private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        navigationItem.largeTitleDisplayMode = .never
        presenter.viewDidLoad()
    }
}

extension DetailViewController: DetailViewProtocol {
    func setPageTitle(_ title: String) {
        self.title = title
    }
    
    func startLoading(urlRequest: URLRequest) {
        webView.load(urlRequest)
    }
}
