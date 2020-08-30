//
//  MovieService.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/02.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya

enum MovieService{
    case getNowPlaying(page: Int)
    case getPopular(page: Int)
    case getDetail(id: Int)
    case getUpcoming(page: Int)
}

extension MovieService: TargetType{
    
    var baseURL: URL {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie") else {
            fatalError("couldn't find baseURL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getNowPlaying(_):
            return "/now_playing"
        case .getPopular(_):
            return "/popular"
        case .getDetail(let id):
            return "\(id)"
        case .getUpcoming(_):
            return "/upcoming"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNowPlaying(_), .getPopular(_), .getDetail(_) ,.getUpcoming(_):
            return .get
            }
    }
    
    var sampleData: Data {
        switch self {
        case .getNowPlaying(let page), .getPopular(let page),.getUpcoming(let page):
            return "{'page':'\(page)'}".data(using: .utf8)!
        case .getDetail(let id):
            return "{'id':'\(id)'}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getNowPlaying(_), .getPopular(_), .getDetail(_), .getUpcoming(_):
            return .requestParameters(parameters: ["api_key":MovieAPI.api_key], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
    
}
