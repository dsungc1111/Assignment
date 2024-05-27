//
//  AdTableViewCell.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {

    @IBOutlet var adMainLabel: UILabel!
    @IBOutlet var adBadgeLabel: UILabel!
    
    let colors = [UIColor.systemTeal, UIColor.blue, UIColor.yellow, UIColor.red, UIColor.brown, UIColor.green, UIColor.orange]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    // UI
    func configureLayout() {
        
        
        adBadgeLabel.layer.masksToBounds = true
        adBadgeLabel.layer.cornerRadius = 10
        adBadgeLabel.backgroundColor = .white
        adBadgeLabel.font = .boldSystemFont(ofSize: 20)
        adBadgeLabel.text = "AD"
        adBadgeLabel.textAlignment = .center
        
        adMainLabel.backgroundColor = colors.randomElement()
        adMainLabel.layer.masksToBounds = true
        adMainLabel.layer.cornerRadius = 10
        adMainLabel.font = .boldSystemFont(ofSize: 20)
        adMainLabel.numberOfLines = 2
        adMainLabel.textAlignment = .center
        
    }
    func configureAd(data: Travel) {
        adMainLabel.text = data.title
    }
    
}
