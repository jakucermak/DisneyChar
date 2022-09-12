//
//  Coordinator.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
