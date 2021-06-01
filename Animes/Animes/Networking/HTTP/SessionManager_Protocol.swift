//
//  SessionManager_Protocol.swift
//  Animes
//
//  Created by Tony Wang on 5/31/21.
//

import Foundation
import Alamofire

protocol SessionManager_Protocol {
    func request(_ request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<Data>) -> Void)
}

extension Session: SessionManager_Protocol {
    func request(_ request: URLRequestConvertible, completionHandler: @escaping (AFDataResponse<Data>) -> Void) {
        self.request(request).responseData(completionHandler: completionHandler)
    }
}
