//
//  AppConfing.swift
//  DisneyCharApp
//
//  Created by Jakub Čermák on 13.09.2022.
//

import Foundation

extension Bundle {
   public func webserviceURL() -> String {
       return self.object(forInfoDictionaryKey: "BASE_URL") as! String
    }
}
