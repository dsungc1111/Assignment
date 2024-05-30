//
//  DetailViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/29/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleString: String?
    var mainImage: String?

    @IBOutlet var selectedImageView: UIImageView!
    
    @IBOutlet var selectedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 화면"
        
        selectedLabel.text = titleString
        let url = URL(string: mainImage!)
        selectedImageView.kf.setImage(with: url)
        selectedImageView.contentMode = .scaleAspectFill
       
    }
    


}
