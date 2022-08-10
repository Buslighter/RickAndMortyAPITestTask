//
//  DataLoader.swift
//  RickAndMortyAPITestTask
//
//  Created by gleba on 08.08.2022.
//

import Foundation
import Alamofire
class DataLoader{
    private var numberOfPages = 0
    private var pageNumber = 0
    var images = [UIImage]()
    func loadCharacterData(completion: @escaping(Character) -> Void){
        
            var url = "https://rickandmortyapi.com/api/character"
            //        var url = "https://rickandmortyapi.com/api/character?page=2"
            if pageNumber>1{url += "?page=\(pageNumber)"}
            
            print("page number \(pageNumber) and \(url)")
            AF.request(url).responseData{ response in
                var result : Character?
                let decoder = JSONDecoder()
                let objects = response.value
                let data = try? decoder.decode(Character.self, from: objects!)
                result = data
                if self.numberOfPages == 0{
                    self.numberOfPages = result?.info.pages ?? 0
                }
                if self.numberOfPages+1 > self.pageNumber{
                self.pageNumber += 1
                DispatchQueue.main.async{
                    completion(result!)
                }
                } else{
                    return
                }
            }
    }
    
    func loadImage(url: String,completion: @escaping(UIImage) -> Void){
        var image = UIImage()
        DispatchQueue.main.async{
            if let data = try? Data(contentsOf: URL(string: url)!) {
                image = UIImage(data: data, scale: 1.0) ?? UIImage()
                completion(image)
            }
        }
    }
    
    func loadEpisodesData(completion: @escaping(Episode) -> Void){
        
            var url = "https://rickandmortyapi.com/api/episode"
            if pageNumber>1{url += "?page=\(pageNumber)"}
            print("page number \(pageNumber) and \(url)")
            AF.request(url).responseData{ response in
                var result : Episode?
                let decoder = JSONDecoder()
                let objects = response.value
                let data = try? decoder.decode(Episode.self, from: objects!)
                result = data
                if self.numberOfPages == 0{
                    self.numberOfPages = result?.info.pages ?? 0
                }
                if self.numberOfPages+1 > self.pageNumber{
                self.pageNumber += 1
                DispatchQueue.main.async{
                    completion(result!)
                }
                } else{
                    return
                }
            }
    }
    func getRightEpisode(episode: String) -> (String,String){
        let seasonRight = episode.index(episode.startIndex, offsetBy: 3)
        let seasonLeft = episode.index(episode.startIndex, offsetBy: 1)
        let episodeLeft = episode.index(episode.startIndex, offsetBy: 4)
        return (String(episode[seasonLeft..<seasonRight]),String(episode[episodeLeft..<episode.endIndex]))
        
    }
    
    func loadLocationsData(completion: @escaping(Location) -> Void){
        
            var url = "https://rickandmortyapi.com/api/location"
            if pageNumber>1{url += "?page=\(pageNumber)"}
            print("page number \(pageNumber) and \(url)")
            AF.request(url).responseData{ response in
                var result : Location?
                let decoder = JSONDecoder()
                let objects = response.value
                let data = try? decoder.decode(Location.self, from: objects!)
                result = data
                if self.numberOfPages == 0{
                    self.numberOfPages = result?.info.pages ?? 0
                }
                if self.numberOfPages+1 > self.pageNumber{
                self.pageNumber += 1
                DispatchQueue.main.async{
                    completion(result!)
                }
                } else{
                    return
                }
            }
    }
    
    
    
}
