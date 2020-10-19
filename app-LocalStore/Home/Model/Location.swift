//
//  Location.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import Foundation

struct Location: Codable {
    let name: String
    let review: Double
    let type: String
    let id: Int
}

struct LocationsListResponse: Codable {
    let listLocations: [Location]
}
