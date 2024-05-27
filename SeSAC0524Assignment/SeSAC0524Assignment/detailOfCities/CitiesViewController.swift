//
//  CitiesViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/27/24.
//

import UIKit
import Kingfisher
import Cosmos

class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var list = TravelInfo().travel

    @IBOutlet var travelInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        travelInfoTableView.rowHeight = 120
        travelInfoTableView.delegate = self
        travelInfoTableView.dataSource = self
        
        let adXib = UINib(nibName: "AdTableViewCell", bundle: nil)
        travelInfoTableView.register(adXib, forCellReuseIdentifier: "AdTableViewCell")
        
        let tourXib = UINib(nibName: "CitiesTableViewCell", bundle: nil)
        travelInfoTableView.register(tourXib, forCellReuseIdentifier: "CitiesTableViewCell")

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = travelInfoTableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
        
        let cell2 = travelInfoTableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as! CitiesTableViewCell
        
        let data = list[indexPath.row]
        
        
        if data.ad == true {
            cell1.configureAd(data: data)
            tableView.rowHeight = 120
            return cell1
        } else {
            tableView.rowHeight = 180
            
            
            cell2.configureCell(data: data)
            
            // citiesTableviewcell에 옮김.
//            cell2.tourSpotLabel.text = data.title
//            cell2.descriptionLabel.text = data.description
//            cell2.scoreNumberLabel.text = "\(data.grade!)"
//            cell2.saveNumberLabel.text = "저장 \(data.save!.formatted())"
//            
//            let url = URL(string: data.travel_image!)
//            cell2.spotImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "star"))
//            cell2.spotImageView.contentMode = .scaleAspectFill
//            
//            let like = data.like! ? "heart.fill" : "heart"
//            let image = UIImage(systemName: like)
//            cell2.likeButton.setImage(image, for: .normal)
                
            return cell2
        }
        
        
        
        
        
    }
    

}
