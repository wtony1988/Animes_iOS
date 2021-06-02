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
    }
    
    // MARK: - Bindings
    private func setupBindings() {
        homeViewModel
            .error
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: {error in
                /*let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let actionOk = UIAlertAction(title: "OK", style: .default) { action in
                }
                alert.addAction(actionOk)
                self.present(alert, animated: true)*/
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        

        homeView.searchBar.searchTextField.rx
            .controlEvent(.editingChanged)
            .asObservable()
            .subscribe({[weak self] _ in
                let query = self?.homeView.searchBar.searchTextField.text!.replacingOccurrences(of: " ", with: "")
                if query != "" {
                    self?.homeViewModel.requestData(with: query!)
                }
                else {
                    self?.homeViewModel.animes.onNext([])
                }
            })
            .disposed(by: disposeBag)
        
        homeViewModel
            .animes
            .bind(to: homeView.tableView.rx.items(cellIdentifier: CellIdentifiers.animeTableCell, cellType: AnimeTableCell.self)) { (row,anime,cell) in
                cell.anime = anime
            }
            .disposed(by: disposeBag)
        
        homeView.tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let animeCell = self?.homeView.tableView.cellForRow(at: indexPath) as? AnimeTableCell
                
                let animeDetailVC = AnimeDetailViewController()
                self?.navigationController?.pushViewController(animeDetailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }

}


