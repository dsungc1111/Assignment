//
//  ShoppingTableViewCell.swift
//  SeSAC0523Assignment
//
//  Created by 최대성 on 5/24/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet var checkButton: UIButton!
    
    @IBOutlet var bookmarkButton: UIButton!
    
    
    @IBOutlet var todoLabel: UILabel!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(data: Shopping) {
        
        let check = data.check ? "checkmark.square.fill" : "checkmark.square"
        let imageCheck = UIImage(systemName: check)
        checkButton.setImage(imageCheck, for: .normal)
        
        
        todoLabel.text = data.todo
        todoLabel.textAlignment = .left
        
        
        let star = data.bookmark ? "star.fill" : "star"
        let image = UIImage(systemName: star)
        bookmarkButton.setImage(image, for: .normal)
        
    }
    
    
}
