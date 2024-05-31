//
//  AdViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/29/24.
//

import UIKit

class AdViewController: UIViewController {

    
    
    @IBOutlet var adTextLaebl: UILabel!
    
    var dataAd: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "광고 화면"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
        
        guard let adScreen = dataAd?.title else { return }
        
        adTextLaebl.text = adScreen
  
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
   
   
}
