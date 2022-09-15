//
// Created by Jakub Čermák on 13.09.2022.
//

import Foundation
import Combine
import UIKit

class CharactersMediator: ObservableObject, AllCharacterService {

    var apiSession: APIService
    var tableView: UITableView
    var cancellables = Set<AnyCancellable>()
    @Published var characters: [Character] = [Character]()

    init(tableView: UITableView) {
        self.apiSession = APISession()
        self.tableView = tableView
    }

    func getAllCharacters(page: Int) {
        let cancellable = self.getAllCharacters(page: page)
                .sink(receiveCompletion: { result in
                    switch result {
                        case .failure(let err):
                            print("Handle Error:", err.localizedDescription)
                    case .finished:
                        break
                    }
                }, receiveValue: { characters in
                    self.characters = self.characters + characters.data
                })
        cancellables.insert(cancellable)
    }
    
    func fetchTable() {
        //TODO: Implement changing pages.
        self.getAllCharacters(page: 1)
        self.cancellables.insert($characters.sink(receiveValue: tableView.items { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: CharacterViewCell.identifier, for: indexPath) as! CharacterViewCell
            cell.name.text = item.name
            return cell
        }))
    }
}
