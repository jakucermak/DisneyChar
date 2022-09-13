//
//  APIService.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 13.09.2022.
//

import Foundation
import Combine

protocol APIService {
    func request<T:Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
