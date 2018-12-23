//
//  ServerManager.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 10/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

import Foundation

class ServerManager: NSObject {
    typealias GetModelClosure = (_ model: SearchModel) -> Void
    typealias GetDataClosure = (_ data: Data) -> Void
    
    static let shared = ServerManager()
    private override init() {}
    
    let apiKey = "c5e29cc9b38c05bd57ef0d059b7e8f11"
    
    func searchMovie(nameFilm: String, completion: @escaping GetModelClosure) {
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(nameFilm)"
        let url = URL(string: urlString)!
        
        let dataTask = URLSession.shared.dataTask(with: url ) { (data, response, error) in
            guard
                error == nil,
                (response as? HTTPURLResponse)?.statusCode == 200,
                let data = data
                else {
                    return
            }
            do {
                let movieFromWeb =  try  JSONDecoder().decode(SearchModel.self, from: data)
                completion (movieFromWeb)
            } catch {
                print("some error")
            }
        }
        dataTask.resume()
    }
    
    func getImage(posterPath:String, completion: @escaping GetDataClosure) {
        
        let urlString = "https://image.tmdb.org/t/p/w500\(posterPath)"
        
        let url = URL(string: urlString)!
        
        let dataTask = URLSession.shared.dataTask(with: url ) { (data, response, error) in
            guard
                error == nil,
                (response as? HTTPURLResponse)?.statusCode == 200,
                let data = data
                else { return }
            
            completion(data)
        }
        dataTask.resume()
    }
}
