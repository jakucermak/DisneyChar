//
//  DetailViewController.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var detailLabelOutlet: UILabel!
    private var label: String = "Label"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabelOutlet.text = label
    }
    
    func setLabel(str: String) {
        label = str
    }

}
