//
//  RequestBuilder.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 13.09.2022.
//

import Foundation
import Combine

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}
