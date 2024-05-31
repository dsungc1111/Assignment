//
//  ReAdTableViewCell.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/28/24.
//

import UIKit

class ReAdTableViewCell: UITableViewCell {

    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adBadgeLabel: UILabel!
    
   
    
    
    let colors = [UIColor.systemTeal, UIColor.blue, UIColor.yellow, UIColor.red, UIColor.brown, UIColor.green, UIColor.orange]
        
    override  func awakeFromNib() {
        super.awakeFromNib()
        adLayout()
    }
    
    
    
    func adLayout() {
        
        
        fontSetting(titleLabel, size: 20)
        titleLabel.textAlignment = .center
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 10
        titleLabel.backgroundColor = colors.randomElement()
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        
        
        
        adBadgeLabel.layer.masksToBounds = true
        adBadgeLabel.backgroundColor = .white
        adBadgeLabel.layer.cornerRadius = 10
        adBadgeLabel.textAlignment = .center
        adBadgeLabel.text = "AD"
        
    }
    
    func configureCell(data: Travel) {
        titleLabel.text = data.title
    }
    
    
}
