//
//  DetailViewController.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    var viewModel: DetailViewModel?
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var charName: UILabel!
    
    @IBOutlet weak var filmsTextView: UITextView!
    @IBOutlet weak var shFilmsTextView: UITextView!
    @IBOutlet weak var videoGamesTextView: UITextView!
    @IBOutlet weak var alliesTextView: UITextView!
    @IBOutlet weak var enemiesTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewModel = viewModel {
            setDetail(viewModel)
            fillTextViews(viewModel)
        }else{
            let dialog = UIAlertController(title: "Error", message: "Character did not load.", preferredStyle: .alert)
            let actionButton = UIAlertAction(title: "Cancel", style: .cancel)
            
            dialog.addAction(actionButton)
            
            self.present(dialog, animated: true) {
               // self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func fillTextViews(_ vm: DetailViewModel) {
        
        let films = vm.films
        let shortFilms = vm.shortFilms
        let videoGames = vm.videoGames
        let allies = vm.allies
        let enemies = vm.enemies
        
        filmsTextView.text = films.isEmpty ? "N/A" : films.joined(separator: "\n")
        shFilmsTextView.text = shortFilms.isEmpty ? "N/A" : shortFilms.joined(separator: "\n")
        videoGamesTextView.text = videoGames.isEmpty ? "N/A" : videoGames.joined(separator: "\n")
        alliesTextView.text = allies.isEmpty ? "N/A" : allies.joined(separator: "\n")
        enemiesTextView.text = enemies.isEmpty ? "N/A" : enemies.joined(separator: "\n")
    }
    
    private func setDetail(_ viewModel: DetailViewModel){
        charName.text = viewModel.name
        charImage.image = viewModel.image
    }
}
