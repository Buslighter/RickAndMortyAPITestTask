////
////  LocationModel.swift
////  RickAndMortyAPITestTask
////
////  Created by gleba on 08.08.2022.
//

import Foundation

struct Location: Codable {
    let info: LocationInfo
    let results: [LocationResult]
}

struct LocationInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

struct LocationResult: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}
