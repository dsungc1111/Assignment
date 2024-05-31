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
    @IBOutlet var starImageView: UIImageView!
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
        
        fontSetting(tourSpotLabel, size: 20)
        fontSetting(descriptionLabel, size: 16)
        fontSetting(scoreNumberLabel, size: 13)
        fontSetting(saveNumberLabel, size: 13)
        
        
        
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 2
        

        scoreNumberLabel.textColor = .lightGray
        saveNumberLabel.textColor = .lightGray
        
        spotImageView.layer.cornerRadius = 5
        
        likeButton.tintColor = .white
        //cosmosView.rating = 4
        
    }
    
    func configureCell(data: Travel) {
        tourSpotLabel.text = data.title
        descriptionLabel.text = data.description
        scoreNumberLabel.text = "\(data.grade!)"
        saveNumberLabel.text = "저장 \(data.save!.formatted())"
        
        guard let imageOfTravel = data.travel_image else { return }
        getImage(spotImageView, data: imageOfTravel)
        
//        let url = URL(string: data.travel_image!)
//        spotImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
//        spotImageView.contentMode = .scaleAspectFill
        
        let like = data.like! ? "heart.fill" : "heart"
        let image = UIImage(systemName: like)
        likeButton.setImage(image, for: .normal)
    }
    
}
