//
//  AllCharacters.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 13.09.2022.
//

import Foundation

enum Endpoints {
    case allCharactersEndpoint(_ parameters: Int)
    case getSingleCharacter(_ parameters: Int)
    
    public var baseURL: String {
        return Bundle.main.webserviceURL()
    }
    
    public var path: String {
        switch self {
        case .allCharactersEndpoint:
            return "characters?page="
        case .getSingleCharacter:
            return "characters/"
        }
    }
    
    public var parameters: String {
        switch self {
        case .getSingleCharacter(let parameters):
            return "\(parameters)"
        case .allCharactersEndpoint(let parameters):
            return "\(parameters)"
        }
    }
}

extension Endpoints: RequestBuilder {
    var urlRequest: URLRequest {
        guard let url: URL = URL(string: baseURL + path + parameters) else { preconditionFailure("Invalid URL format") }
        let request: URLRequest = URLRequest(url: url)
        return request
    }
}
