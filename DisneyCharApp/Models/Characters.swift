//
//  Characters.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 13.09.2022.
//

import Foundation

// MARK: - Characters
struct Characters: Codable {
    let data: [Character]
    let count, totalPages: Int
    let nextPage: String
}

// MARK: - Datum
struct Character: Codable {
    let films, shortFilms, tvShows, videoGames: [String]
    let parkAttractions: [String]
    let allies, enemies: [String]
    let id: Int
    let name: String
    let imageURL: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case films, shortFilms, tvShows, videoGames, parkAttractions, allies, enemies
        case id = "_id"
        case name
        case imageURL = "imageUrl"
        case url
    }
}
