//
//  TravelTableViewCell.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/25/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    func configureLayout() {
        travelImageView.layer.cornerRadius = 10
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.numberOfLines = 0
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = .lightGray
    }
    
    
    func configureCell(data: Magazine) {
        titleLabel.text = data.title
        
        if titleLabel.text!.count >= 25 {
            titleLabel.font = .systemFont(ofSize: 16)
        }
        subtitleLabel.text = data.subtitle
        
        getImage(travelImageView, data: data.photo_image)
        
//        let url = URL(string: data.photo_image)
//        travelImageView.kf.setImage(with: url)
//        travelImageView.contentMode = .scaleAspectFill
    }
    
    
    func changeDateFormat(data: Magazine) {
        // string > date형식
        let datestr = data.date
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyMMdd"
        dateformatter.locale = Locale(identifier: "ko-KR")
        
        let convertDate = dateformatter.date(from: datestr)

        let myDate = DateFormatter()
        myDate.dateFormat = "yyyy년 MM월 dd일"
        myDate.locale = Locale(identifier:"ko_KR")
        let convertStr = myDate.string(from: convertDate!)

        
        dateLabel.text = convertStr
        dateLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .lightGray
    }
    
    
}
