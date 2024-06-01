//
//  CitiesViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/27/24.
//

import UIKit
import Kingfisher
import Cosmos

class CitiesViewController: UIViewController {
   
    var list = TravelInfo().travel

    @IBOutlet var travelInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        travelInfoTableView.delegate = self
        travelInfoTableView.dataSource = self
        
        let adXib = UINib(nibName: AdTableViewCell.identifier, bundle: nil)
        travelInfoTableView.register(adXib, forCellReuseIdentifier: AdTableViewCell.identifier)
        
        let tourXib = UINib(nibName: CitiesTableViewCell.identifier, bundle: nil)
        travelInfoTableView.register(tourXib, forCellReuseIdentifier: CitiesTableViewCell.identifier)

    }

}


extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = list[indexPath.row]
        
        
        if data.ad  {
            guard let cell1 = travelInfoTableView.dequeueReusableCell(withIdentifier: AdTableViewCell.identifier, for: indexPath) as? AdTableViewCell else { return AdTableViewCell() }
            
            cell1.configureAd(data: data)
            
            return cell1
        } else {
            guard let cell2 = travelInfoTableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier, for: indexPath) as? CitiesTableViewCell else { return CitiesTableViewCell() }
            
            
            
            cell2.configureCell(data: data)
            return cell2
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = list[indexPath.row]
        
        if data.ad {
            return 120
        } else {
            return 180
        }
    }
    
}
