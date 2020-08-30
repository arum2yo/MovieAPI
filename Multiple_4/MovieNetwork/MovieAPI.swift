//
//  MovieNetwork.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/02.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import Foundation
import Moya
import ProgressHUD

class MovieAPI{
    
    static let api_key = "8d9e29839ec490e7258a4e3162836521"
    static let decoder = JSONDecoder()
    static let provider = MoyaProvider<MovieService>()
    
    static func getNowplayingNetwork(page: Int, completion: @escaping ([Movie]) -> ()){
        
        ProgressHUD.show()
        provider.request(.getNowPlaying(page: page)) { (result) in
            switch result{
            case .success(let response):
                do{
                   let results = try! decoder.decode(APIResult.self, from: response.data)
//                    print(results)
                    completion(results.results)
                    
                    
                }catch{
                    print(error)
                    ProgressHUD.dismiss()
                    break
                }
            case .failure(let error):
                print(error)
                ProgressHUD.dismiss()
                break
            }
        }
        
    }
    
    static func getPopularNetwork(page: Int, completion: @escaping([Movie])->()){
        
        ProgressHUD.show()
        provider.request(.getPopular(page: page)) { (result) in
            switch result{
            case .success(let response):
                
                do{
                    let results = try! decoder.decode(APIResult.self, from: response.data)
                    completion(results.results)
                    
                }catch{
                    print(error)
                    ProgressHUD.dismiss()
                    break
                }
            case .failure(let error):
                print(error)
                ProgressHUD.dismiss()
                break
            }
        }
    }
    
    static func getDetailMovie(id: Int, completion: @escaping (DeTailMovie)->()){
        
        ProgressHUD.show()
        provider.request(.getDetail(id: id)) { (result) in
            switch result{
            case .success(let response):
                do{
                    
                   let results = try! decoder.decode(DeTailMovie.self, from: response.data)
                    completion(results.self)
                    
                }catch{
                    print(error)
                    ProgressHUD.dismiss()
                    break
                }
            case .failure(let error):
                print(error)
                ProgressHUD.dismiss()
                break
            }
        }
    }
    
    static func getUpcoming(page: Int, completion: @escaping([Movie]) -> ()){
        
        provider.request(.getUpcoming(page: 1)) { (result) in
            switch result{
            case .success(let response):
                
                do{
                    let results = try! decoder.decode(APIResult.self, from: response.data)
                    completion(results.results)
                    
                }catch{
                    print(error)
                    ProgressHUD.dismiss()
                    break
                }
            case .failure(let error):
                print(error)
                ProgressHUD.dismiss()
                break
                
            }
        }
    }
}
