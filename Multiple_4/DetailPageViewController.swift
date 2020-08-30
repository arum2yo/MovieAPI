//
//  DetailPageViewController.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/02.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import WebKit
import Moya
import ProgressHUD
import Kingfisher

class DetailPageViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet weak var movieIMg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieHomePage: UILabel!
    
    
    var id: Int?
    
    let provider = MoyaProvider<MovieService>()
    var detailMovie: DeTailMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieAPI.getDetailMovie(id: id!) { (results) in
            self.detailMovie = results
            self.movieIMg.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(self.detailMovie!.poster_path)"))
            self.movieTitle.text = self.detailMovie?.original_title
            self.movieHomePage.text = self.detailMovie?.homepage
            
            }
        
        ProgressHUD.dismiss()
        }
        
        
        
        
        
//        WKWebView(frame: self.view.frame)
//        webView.uiDelegate = self
//        webView.navigationDelegate = self
//        
//        MovieAPI.getDetailMovie(id: id!) { (results) in
//            print("id is~~> \(self.id!)")
//            
//            self.detailMovie = results
//            
//            let url = URL(string: self.detailMovie!.homepage)
//            
//            guard url != nil else {
//                fatalError("couldn't create WebPage")
//            }
//            let request = URLRequest(url: url!)
//            self.webView.load(request)
//            
//            self.view = self.webView
//        }
        
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
