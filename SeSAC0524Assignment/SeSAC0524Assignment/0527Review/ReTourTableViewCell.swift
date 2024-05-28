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
        
        fontSetting(titleLabel, 20)
        fontSetting(descriptionLabel, 15)
        fontSetting(scoreLabel, 12)
        
        
        descriptionLabel.numberOfLines = 0
        
        scoreLabel.textColor = .gray
      
        
        tourImageView.layer.cornerRadius = 10
        tourImageView.contentMode = .scaleAspectFill
        
    }
    
    func configureCell(data: Travel) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        scoreLabel.text = data.evaluation
        
        let url = URL(string: data.travel_image!)
        tourImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        
        
        let like = data.like! ? "star.fill" : "star"
        let image = UIImage(systemName: like)
        likeButton.setImage(image, for: .normal)
    }
    
}
