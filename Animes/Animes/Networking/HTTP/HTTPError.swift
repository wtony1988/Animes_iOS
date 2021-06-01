//
//  HTTPError.swift
//  Animes
//
//  Created by Tony Wang on 5/31/21.
//

import Foundation

enum HTTPError: Error, Equatable {
    case statusCode(Int)
    case emptyResponse
}
