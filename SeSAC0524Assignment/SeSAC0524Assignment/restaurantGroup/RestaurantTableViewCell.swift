//
//  RestaurantTableViewCell.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/26/24.
//

import UIKit
import Kingfisher
import CoreLocation

class RestaurantTableViewCell: UITableViewCell {

   
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantNameLabel: UILabel!
    
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var minimumPriceLabel: UILabel!
    
    @IBOutlet var adressLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    
    
    func figureLayout() {
        
        restaurantImageView.contentMode = .scaleAspectFill
        restaurantImageView.layer.cornerRadius = 10
        restaurantNameLabel.font = .boldSystemFont(ofSize: 15)
        restaurantNameLabel.numberOfLines = 0
        
        fontSetting(minimumPriceLabel)
       
    }
    
    func figureCell(data: Restaurant) {
        let url = URL(string: data.image)
        restaurantImageView.kf.setImage(with: url)
        //가게이름
        restaurantNameLabel.text = data.name
        //전화
        phoneNumberLabel.text = data.phoneNumber
        fontSetting(phoneNumberLabel)
        
        //최소주문
        minimumPriceLabel.text = "최소주문 \(data.price.formatted())원"
        
        // 북마크
        let image = data.like ? "star.fill" : "star"
        let bookmark = UIImage(systemName: image)
        likeButton.setImage(bookmark, for: .normal)

        

        //주소
        // 신주소 사용
        let findLocation = CLLocation(latitude: data.latitude, longitude: data.longitude)
               let geocoder = CLGeocoder()
               let locale = Locale(identifier: "Ko-kr")
               geocoder.reverseGeocodeLocation(findLocation, preferredLocale: locale, completionHandler: {(placemarks, error) in
                   if let address: [CLPlacemark] = placemarks {
                       if let name: String = address.last?.name { self.adressLabel.text = "주소 : \(name)" }
                   }
               })
        //adressLabel.font = .systemFont(ofSize: 12)
        fontSetting(adressLabel)
    }
    
}
