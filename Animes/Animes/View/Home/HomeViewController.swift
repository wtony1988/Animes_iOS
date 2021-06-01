//
//  ViewController.swift
//  Animes
//
//  Created by Tony Wang on 5/30/21.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {

    lazy var homeView = HomeView()
    
    var homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        
        homeViewModel.requestData()
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        homeViewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {error in
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                self.present(alert, animated: true)
            })
            .disposed(by: disposeBag)
        
        homeViewModel
            .animes
            .bind(to: homeView.tableView.rx.items(cellIdentifier: CellIdentifiers.animeTableCell, cellType: AnimeTableCell.self)) { (row,anime,cell) in
                cell.anime = anime
            }
            .disposed(by: disposeBag)
        
    }

}


