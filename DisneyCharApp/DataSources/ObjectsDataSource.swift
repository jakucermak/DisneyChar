//
//  ObjectDataSource.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 12.09.2022.
//

import UIKit
import Combine

class ObjectsDataSource<T>: NSObject, UITableViewDataSource {
    
    var objects: [T] = []
    var build: (UITableView, IndexPath, T) -> UITableViewCell
    
    init(builder: @escaping (UITableView, IndexPath, T) -> UITableViewCell ){
        self.build = builder
        super.init()
    }
    
    func pushObjects(_ objects: [T], to tableView: UITableView) {
        tableView.dataSource = self
        self.objects = objects
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return build(tableView, indexPath, objects[indexPath.row])
    }
}


extension UITableView {
    func items<T>(_ builder: @escaping (UITableView, IndexPath, T) -> UITableViewCell) -> ([T]) -> Void {
        let dataSource = ObjectsDataSource(builder: builder)
        return { items in
            dataSource.pushObjects(items, to: self)
        }
    }
}

