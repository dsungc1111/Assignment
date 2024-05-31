//
//  UITableViewCell+Extension.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/30/24.
//

import UIKit
import Kingfisher


extension UITableViewCell {
    
    func getImage(_ image: UIImageView, data: String) {
        let url = URL(string: data)
        image.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
        image.contentMode = .scaleAspectFill
    }
}
