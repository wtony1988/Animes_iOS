//
//  HomeView.swift
//  Animes
//
//  Created by Tony Wang on 6/1/21.
//

import UIKit


final class HomeView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnimeTableCell.self, forCellReuseIdentifier: CellIdentifiers.animeTableCell)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(tableView)

        topAnchor.constraint(equalTo: tableView.topAnchor, constant: 0.0).isActive = true
        bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 0.0).isActive = true
        leadingAnchor.constraint(equalTo: tableView.leadingAnchor, constant: -16.0).isActive = true
        trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 16.0).isActive = true
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
