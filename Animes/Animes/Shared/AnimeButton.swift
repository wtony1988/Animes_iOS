//
//  AnimeButton.swift
//  Animes
//
//  Created by Tony Wang on 6/3/21.
//

import UIKit

class AnimeButton: UIButton {

    public init(color: UIColor = AnimeColors.primaryButtonColor) {
        super.init(frame: .zero)
        self.setTitleColor(color, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.layer.masksToBounds = true
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
