//
//  Anime.swift
//  Animes
//
//  Created by Tony Wang on 5/31/21.
//

import Foundation

struct Anime: Decodable,Equatable {
    let malId: Int
    let title: String
    let synopsis: String
    let type: String
    let rated: String?
    let score: Double
    let members: Double
    let imageUrl: String
    let url: String?
    let startDate: Date?
}

