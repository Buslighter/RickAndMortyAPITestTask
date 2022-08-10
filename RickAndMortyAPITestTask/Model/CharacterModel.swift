//
//  CharacterModel.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 08.08.2022.

import Foundation

struct Character: Codable {
    let info: Info
    let results: [CharacterResult]
}

struct Info: Codable {
    let count, pages: Int
    let next, prev: String?
}

struct CharacterResult: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin, location: CharacterLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}
struct CharacterLocation: Codable {
    let name: String
    let url: String
}



