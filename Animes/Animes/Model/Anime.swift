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
    let episodes: Int
    let members: Int
    let imageUrl: String
    let url: String?
    let startDate: Date?
    let endDate: Date?
}

