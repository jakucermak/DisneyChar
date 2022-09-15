//
//  MainCoordinator.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    func getDetailViewController(character: Character){
        let vc = DetailViewController.instantiate()
        vc.coordinator = self
        vc.viewModel = DetailViewModel(character: character)
        navigationController.showDetailViewController(vc, sender: nil)
    }

}
