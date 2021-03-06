//
//  HomeViewModel.swift
//  Animes
//
//  Created by Tony Wang on 5/31/21.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    
    public let animes: PublishSubject<[Anime]> = PublishSubject()
    public let loading: PublishSubject<Bool> = PublishSubject()
    public let error: PublishSubject<Error> = PublishSubject()
    
    private let disposeBag = DisposeBag()
    
    public func requestData(with query: String) {
        self.loading.onNext(true)
        
        WebService().animes(query: query) { result in
            self.loading.onNext(false)
            
            switch result {
            case let .success(animes):
                print(animes)
                self.animes.onNext(animes)
            case let .failure(error):
                print(error.localizedDescription)
                self.animes.onNext([])
                self.error.onNext(error)
            }
        }
    }
}
