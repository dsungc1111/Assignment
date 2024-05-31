//
//  ReTourTableViewCell.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/28/24.
//

import UIKit

class ReTourTableViewCell: UITableViewCell {


    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var tourImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        tourLayout()
    }
    
    func tourLayout() {
        
        fontSetting(titleLabel, size: 20)
        fontSetting(descriptionLabel, size: 15)
        fontSetting(scoreLabel, size: 12)
        
        
        descriptionLabel.numberOfLines = 0
        
        scoreLabel.textColor = .gray
      
        
        tourImageView.layer.cornerRadius = 10
        tourImageView.contentMode = .scaleAspectFill
        
    }
    
    func configureCell(data: Travel) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        scoreLabel.text = data.evaluation
        
        
        getImage(tourImageView, data: data.travel_image ?? "star")
      
        
        
        let like = data.like! ? "star.fill" : "star"
        let image = UIImage(systemName: like)
        likeButton.setImage(image, for: .normal)
    }
    
}
