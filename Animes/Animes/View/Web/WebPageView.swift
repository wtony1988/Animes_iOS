//
//  WebPageView.swift
//  Animes
//
//  Created by Tony Wang on 6/4/21.
//

import UIKit
import WebKit

class WebPageView: UIView {

    public var url: URL! {
        didSet {
            webView.load(URLRequest(url: url))
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    private func commonInit() {
        backgroundColor = .white
        safelyAddSubview(webView)
    }
}
