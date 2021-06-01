//
//  AnimeLabel.swift
//  Animes
//
//  Created by Tony Wang on 6/1/21.
//

import UIKit

class AnimeLabel: UILabel {

    public init(style: UIFont.TextStyle, alignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.numberOfLines = 0
        self.textAlignment = alignment
        self.lineBreakMode = .byWordWrapping
        self.font = .preferredFont(forTextStyle: style)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
