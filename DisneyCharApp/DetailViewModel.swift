//
//  DetailViewModel.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 14.09.2022.
//

import Foundation
import UIKit

class DetailViewModel {
    var name: String
    var image: UIImage = UIImage(named: "DisneyImage")!
    var imageURL: String
    var films, shortFilms, videoGames: [String]
    var allies, enemies: [String]
    
    init(character: Character) {
        self.name = character.name
        self.imageURL = character.imageURL
        self.films = character.films
        self.shortFilms = character.shortFilms
        self.videoGames = character.videoGames
        self.allies = character.allies
        self.enemies = character.enemies
        downloadImage()
    }
    
    private func downloadImage() {
       guard let url = URL(string: imageURL) else {
           return
       }
       
       guard let data = try? Data(contentsOf: url) else {
           return
       }
       
       guard let image = UIImage(data: data) else {
           return
       }
       
       self.image = image
    }
    
}
