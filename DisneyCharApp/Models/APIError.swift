//
//  APIError.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 13.09.2022.
//

import Foundation

enum APIError: Error {
    case encodingError
    case httpError(Int)
    case decodingError
    case unknown
}
