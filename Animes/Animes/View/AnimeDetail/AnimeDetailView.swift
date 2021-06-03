//
//  AnimeDetailView.swift
//  Animes
//
//  Created by Tony Wang on 6/2/21.
//

import UIKit
import SDWebImage

class AnimeDetailView: UIView {
    
    public var anime: Anime! {
        didSet {
            imageView.sd_setImage(with: URL(string: anime.imageUrl))
            titleLabel.text = anime.title
            synopsisLabel.text = anime.synopsis
            typeLabel.text = anime.type
            ratedLabel.text = anime.rated
            scoreLabel.text = String(format: "⭐️ %.02f", anime.score)
            episodesLabel.text = String(format: "Episodes: %d", anime.episodes)
            membersLabel.text = String(format: "Members: %d", anime.members)
            startDateLabel.text = anime.startDate?.formatted
            endDateLabel.text = anime.endDate?.formatted
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel = AnimeLabel(style: .headline)
    let synopsisLabel = AnimeLabel(style: .caption1)
    
    let typeLabel = AnimeLabel(style: .subheadline)
    let ratedLabel = AnimeLabel(style: .subheadline)
    let scoreLabel = AnimeLabel(style: .subheadline)
    lazy var subInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [typeLabel, ratedLabel, scoreLabel])
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let episodesLabel = AnimeLabel(style: .subheadline)
    let membersLabel = AnimeLabel(style: .subheadline)
    let startDateLabel = AnimeLabel(style: .subheadline)
    let endDateLabel = AnimeLabel(style: .subheadline)
    let moreButton = AnimeButton(title: "More Button")
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, synopsisLabel, subInfoStackView, episodesLabel, membersLabel, startDateLabel, endDateLabel, moreButton])
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()

    private func commonInit() {
        backgroundColor = .white
        safelyAddSubview(stackView)
        stackView.marginToSuperviewSafeArea(top: 0, bottom: 0, leading: 16, trailing: 16)
    }
}
