//
//  ReviewCell+Extention.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/28/24.
//

import UIKit

extension UITableViewCell {
    
    func fontSetting(_ label: UILabel, size: Int) {
        if size == 20 {
            label.font = .boldSystemFont(ofSize: CGFloat(size))
        } else {
            label.font = .systemFont(ofSize: CGFloat(size))
        }
    }
    
    
    
    
    
}
