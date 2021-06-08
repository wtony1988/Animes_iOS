//
//  AnimeDetail2ViewController.swift
//  Animes
//
//  Created by Tony Wang on 6/6/21.
//

import UIKit
import SDWebImage

class AnimeDetail2ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSynopsis: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblRated: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblEpisodes: UILabel!
    @IBOutlet weak var lblMembers: UILabel!
    @IBOutlet weak var lblStartdate: UILabel!
    @IBOutlet weak var lblEnddate: UILabel!
    
    
    public var anime: Anime?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.sd_setImage(with: URL(string: anime!.imageUrl))
        lblTitle.text = anime?.title
        lblSynopsis.text = anime?.synopsis
        lblType.text = anime?.type
        lblRated.text = anime?.rated
        lblScore.text = String(format: "⭐️ %0.1f", anime!.score)
        lblEpisodes.text = String(format: "Episodes: %d", anime!.episodes)
        lblMembers.text = String(format: "Members: %d", anime!.members)
        lblStartdate.text = String(format: "Start date: %@", anime!.startDate!.formatted)
        lblEnddate.text = String(format: "End date: %@", anime!.endDate!.formatted)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Event Handlers
    @IBAction func onMoreDetail(_ sender: Any) {
        let webViewController = WebPageViewController(url: URL(string: anime?.url ?? "https://myanimelist.net/")!)
        self.navigationController?.pushViewController(webViewController, animated: true)
    }
}
