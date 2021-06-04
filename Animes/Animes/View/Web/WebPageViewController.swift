//
//  WebPageViewController.swift
//  Animes
//
//  Created by Tony Wang on 6/4/21.
//

import UIKit

class WebPageViewController: UIViewController {

    private let url: URL
    lazy var webView = WebPageView()
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.url = self.url
    }
}
