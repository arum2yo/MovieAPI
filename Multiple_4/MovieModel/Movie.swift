//
//  Movie.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/02.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation

struct APIResult: Decodable {
    
    let page: Int
    var total_results: Int
    var total_pages: Int
    var results:[Movie]
    
}

struct Movie: Decodable {
    
    let id: Int
    var popularity: Double
    var vote_count: Int
    var img_path: String
    var movieTitle: String
    var vote_average: Double
    var overview: String
    var release_date: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case popularity
        case vote_count
        case img_path = "poster_path"
        case movieTitle = "original_title"
        case vote_average
        case overview
        case release_date
        
    }
}

struct DeTailMovie: Decodable {
    let id: Int
    var original_title: String
    var poster_path: String
    var vote_average: Double
    var homepage: String

}
