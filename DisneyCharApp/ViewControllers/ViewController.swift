//
//  ViewController.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import UIKit
import Combine

class ViewController: UIViewController, UITableViewDelegate, Storyboarded {
    
    var currPage: Int = 1
    weak var coordinator: MainCoordinator?
    @IBOutlet weak var characterTableView: UITableView!
    var presenter: CharactersMediator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        characterTableView.delegate = self
        presenter = CharactersMediator(tableView: characterTableView)
        presenter?.fetchTable()
        characterTableView.register(CharacterViewCell.nib, forCellReuseIdentifier: CharacterViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let character = presenter?.characters[indexPath.row]{
            coordinator?.getDetailViewController(character: character)
        }else{
            let dialog = UIAlertController(title: "Error", message: "Character not found!", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            
            dialog.addAction(cancelButton)
            
            self.present(dialog, animated: true, completion: nil)
        }
    }
}

