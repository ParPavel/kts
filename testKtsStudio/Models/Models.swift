//
//  Models.swift
//  testKtsStudio
//
//  Created by Pavel Scope on 10/12/2018.
//  Copyright © 2018 Pavel Scope. All rights reserved.
//

import Foundation

public struct SearchModel: Decodable {
    var title: String?
    var movies: [MovieFromServer]?
    var searchCount : Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case movies = "results"
        case searchCount = "total_results"
    }
}

struct MovieFromServer: Decodable {
    var id: Int
    var title: String
    var overview : String
    var posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
}
