//
//  HomeView.swift
//  Animes
//
//  Created by Tony Wang on 6/1/21.
//

import UIKit


final class HomeView: UIView {
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.tableFooterView = UIView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AnimeTableCell.self, forCellReuseIdentifier: CellIdentifiers.animeTableCell)
        return tableView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchBar, tableView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        safelyAddSubview(stackView)
        stackView.marginToSuperviewSafeArea(top: 0, bottom: 0, leading: 0, trailing: 0)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
