//
//  ObjectDataSource.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import UIKit

class ObjectDataSource: NSObject, UITableViewDataSource {
    
    var objects = ["Hello","From","Swift"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell", for: indexPath) as! CharacterViewCell
        let object = objects[indexPath.row]
        cell.Label.text = object
        return cell
    }
    

}
