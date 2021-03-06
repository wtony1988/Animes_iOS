//
//  AnimeDetailViewController.swift
//  Animes
//
//  Created by Tony Wang on 6/2/21.
//

import UIKit

final class AnimeDetailViewController: UIViewController {

    private let anime: Anime
    lazy var detailView = AnimeDetailView()
    
    init(anime: Anime) {
        self.anime = anime
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.anime = self.anime
        detailView.moreButton.addTarget(self, action: #selector(onMore(sender:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Event Handlers
    @objc func onMore(sender: UIButton) {
        let webViewController = WebPageViewController(url: URL(string: anime.url!)!)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
}
