//
//  AnimeTableCell.swift
//  Animes
//
//  Created by Tony Wang on 6/1/21.
//

import UIKit
import SDWebImage

class AnimeTableCell: UITableViewCell {
    
    public var anime: Anime! {
        didSet {
            thumbImageView.sd_setImage(with: URL(string: anime.imageUrl))
            titleLabel.text = anime.title
            synopsisLabel.text = anime.synopsis
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let thumbImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let titleLabel = AnimeLabel(style: .headline)
    let synopsisLabel = AnimeLabel(style: .caption1)
    
    private lazy var descStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, synopsisLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [thumbImageView, descStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        return stackView
    }()
    
    private func commonInit() {
        backgroundColor = .white
        safelyAddSubview(stackView)
        stackView.marginToSuperviewSafeArea(top: 12, bottom: 12, leading: 16, trailing: 0)
        thumbImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        thumbImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
    }
}
