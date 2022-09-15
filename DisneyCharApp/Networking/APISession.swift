//
//  APISession.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 13.09.2022.
//

import Foundation
import Combine

struct APISession: APIService {

    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
        let decoder = JSONDecoder()

        return URLSession.shared
                .dataTaskPublisher(for: builder.urlRequest)
                .receive(on: DispatchQueue.main)
                .mapError { _  in .unknown }
                .flatMap { (data: Data, response: URLResponse) -> AnyPublisher<T, APIError> in
                    if let response = response as? HTTPURLResponse {
                        if (200...299).contains(response.statusCode) {
                            return Just(data)
                                .decode(type: T.self, decoder: decoder)
                                .mapError{ _ in .decodingError }
                                .eraseToAnyPublisher()
                        }else{
                            return Fail(error: APIError.httpError(response.statusCode))
                                .eraseToAnyPublisher()
                        }
                    }
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }.eraseToAnyPublisher()
    }
    
}
