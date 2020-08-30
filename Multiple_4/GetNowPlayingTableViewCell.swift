//
//  GetNowPlayingTableViewCell.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/02.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Kingfisher
import FloatRatingView

class GetNowPlayingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleasedate: UILabel!
    @IBOutlet weak var movieVoteAve: UILabel!
  
    @IBOutlet weak var movieRatingView: FloatRatingView!
    var displayCell: Movie?
    
    func getDisplay(movie: Movie){
        
        self.displayCell = movie
        
        movieImg.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(displayCell!.img_path)"))
        movieTitle.text = displayCell?.movieTitle
        movieReleasedate.text = displayCell?.release_date
        
        movieRatingView.contentMode = .scaleAspectFit
        movieRatingView.backgroundColor = .clear
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
