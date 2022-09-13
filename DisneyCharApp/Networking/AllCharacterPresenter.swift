//
// Created by Jakub Čermák on 13.09.2022.
//

import Foundation
import Combine

class AllCharactersPresenter: ObservableObject, AllCharacterService {

    var apiSession: APIService
    var cancellables = Set<AnyCancellable>()
    @Published var characters: [Character] = [Character]()

    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
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

}
