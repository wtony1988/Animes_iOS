//
//  WebService.swift
//  Animes
//
//  Created by Tony Wang on 5/31/21.
//


import Foundation
import Alamofire

protocol WebService_Protocol {
    func animes(query: String, completion: @escaping (Result<[Anime], Error>) -> Void)
}

class WebService: WebService_Protocol {
    private let httpClient: HTTPClient_Protocol
    private let jsonDecoder: JSONDecoder

    init(httpClient: HTTPClient_Protocol = HTTPClient()) {
        self.httpClient = httpClient
        self.jsonDecoder = JSONDecoder()
        self.jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = APIConstants.dateFormat
        self.jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
    }

    
    func animes(query: String, completion: @escaping (Result<[Anime], Error>) -> Void) {
        let urlString = APIConstants.searchURL + String(format: "?q=%@", query)
        let request = HTTPRequest(url: URL(string: urlString)!)
        httpClient.send(request: request) { result in
            switch result {
            case let .success(value):
                completion(Result(catching: { try self.jsonDecoder.decode(AnimesResponseBody.self, from: value).results }))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    struct AnimesResponseBody: Decodable, Equatable {
        let results: [Anime]
    }
}
