//
//  PopularCityTableViewCell.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/29/24.
//

import UIKit

class PopularCityTableViewCell: UITableViewCell {

   
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var kindOfCitiesLabel: UILabel!
    
    @IBOutlet var cityImageView: UIImageView!
    
    static var identifier = "PopularCityTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        cityNameLabel.font = .boldSystemFont(ofSize: 20)
        cityNameLabel.textColor = .white
        cityNameLabel.textAlignment = .right
        
        kindOfCitiesLabel.font = .systemFont(ofSize: 15)
        kindOfCitiesLabel.textColor = .white
        kindOfCitiesLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        kindOfCitiesLabel.layer.masksToBounds = true
        kindOfCitiesLabel.layer.cornerRadius = 20
        kindOfCitiesLabel.layer.maskedCorners = CACornerMask.layerMaxXMaxYCorner
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.masksToBounds = true
        cityImageView.clipsToBounds = true
        cityImageView.layer.cornerRadius = 20
        cityImageView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
        
//        cityImageView.layer.shadowOffset = CGSize(width: 5, height: 2)
//        cityImageView.layer.shadowOpacity = 0.5
//        cityImageView.layer.shadowRadius = 10
            
        }
    
    func configureCell(data: City) {
        cityNameLabel.text = "\(data.city_name) | \(data.city_english_name)"
        
        kindOfCitiesLabel.text = "  \(data.city_explain)"
        
        let url = URL(string: data.city_image)
        cityImageView.kf.setImage(with: url)
    }
    
    

}
    
    

