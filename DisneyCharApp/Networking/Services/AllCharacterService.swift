//
// Created by Jakub Čermák on 13.09.2022.
//

import Foundation
import Combine

protocol AllCharacterService {
    var apiSession: APIService { get }

    func getAllCharacters(page: Int) -> AnyPublisher<Characters, APIError>
}

extension AllCharacterService {
    func getAllCharacters(page: Int) -> AnyPublisher<Characters, APIError> {
        return apiSession.request(with: Endpoints.allCharactersEndpoint(page)).eraseToAnyPublisher()
    }
}
