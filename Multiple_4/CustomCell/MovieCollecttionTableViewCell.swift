//
//  MovieCollecttionTableViewCell.swift
//  Multiple_4
//
//  Created by Ahreum CHO on 2020/08/30.
//  Copyright © 2020 Ahreum CHO. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollecttionTableViewCell: UITableViewCell {


    @IBOutlet var collectionView: UICollectionView!{
        didSet{
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
        }
    }
    
    
        public var upcomingMovie = [Movie](){
            didSet{
                self.collectionView.reloadData()
            }
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
    }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }

    }

    extension MovieCollecttionTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate{
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return upcomingMovie.count
            
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingItem", for: indexPath) as! UpcomingCollectionViewCell

            cell.getDidplayCell2(movie: upcomingMovie[indexPath.row])
           
            return cell
        }
    }
