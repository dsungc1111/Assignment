//
//  CitiesTableViewCell.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/27/24.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {

    @IBOutlet var tourSpotLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var scoreNumberLabel: UILabel!
    @IBOutlet var saveNumberLabel: UILabel!
    @IBOutlet var spotImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        travelLayout()
    }
    
    //UI
    func travelLayout() {
        
        
        tourSpotLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionLabel.font = .systemFont(ofSize: 16)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 2
        
        scoreNumberLabel.font = .systemFont(ofSize: 13)
        scoreNumberLabel.textColor = .lightGray
        
        saveNumberLabel.font = .systemFont(ofSize: 13)
        saveNumberLabel.textColor = .lightGray
        
        spotImageView.layer.cornerRadius = 5
        
        likeButton.tintColor = .white
        
    }
    
    func configureCell(data: Travel) {
        tourSpotLabel.text = data.title
        descriptionLabel.text = data.description
        scoreNumberLabel.text = "\(data.grade!)"
        saveNumberLabel.text = "저장 \(data.save!.formatted())"
        
        let url = URL(string: data.travel_image!)
        spotImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        spotImageView.contentMode = .scaleAspectFill
        
        let like = data.like! ? "heart.fill" : "heart"
        let image = UIImage(systemName: like)
        likeButton.setImage(image, for: .normal)
    }
    
}
