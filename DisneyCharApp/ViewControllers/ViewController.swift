//
//  ViewController.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var characterTableView: UITableView!
    
    var dataSource = ObjectDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        characterTableView.dataSource = dataSource
        characterTableView.delegate = self
        
        characterTableView.register(CharacterViewCell.nib, forCellReuseIdentifier: CharacterViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.getDetailViewController(label: "Hooray")
    }
    
}

