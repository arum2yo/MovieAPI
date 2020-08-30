//
//  GetpopularTableViewCell.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/02.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import FloatRatingView
import Kingfisher

class GetpopularTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieVoteAve: UILabel!
    @IBOutlet weak var movieRatingView: FloatRatingView!
    
    var displayCell: Movie?
    
    func getDidplayCell2(movie: Movie){
        self.displayCell = movie
        
        movieImg.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(displayCell!.img_path)"))
        
        movieTitle.text = displayCell?.movieTitle
        movieReleaseDate.text = displayCell?.release_date
        
        movieRatingView.backgroundColor = .clear
        movieRatingView.contentMode = .scaleAspectFill
        movieRatingView.type = .floatRatings
        movieRatingView.rating = displayCell!.vote_average / 2
        
        movieVoteAve.text = String(format: "%.2f", self.movieRatingView.rating)
        
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
