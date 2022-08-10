////
////  EpisodeModel.swift
////  RickAndMortyAPITestTask
////
////  Created by gleba on 08.08.2022.
////

import Foundation


struct Episode: Codable{
    var info: EpisodeInfo
    var results: [EpisodeResult]
}

struct EpisodeInfo: Codable {
    let count, pages: Int
    let next, prev: String?
    
}

struct EpisodeResult: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}



