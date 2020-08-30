//
//  UpcomingCollectionViewCell.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/30.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit

class UpcomingCollectionViewCell: UICollectionViewCell {
    @IBOutlet var moviePosterIMG: UIImageView!{
        didSet{
            
            self.moviePosterIMG.layer.cornerRadius = 3
            self.moviePosterIMG.layer.masksToBounds = true
            
        }
    }
    @IBOutlet var movieTitle: UILabel!
    
    var displayCell: Movie?
    func getDidplayCell2(movie: Movie){
         self.displayCell = movie
        
        movieTitle.text = displayCell?.movieTitle
        moviePosterIMG.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(displayCell!.img_path)"))
    }
    
}
