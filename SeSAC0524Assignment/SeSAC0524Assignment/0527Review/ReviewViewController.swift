//
//  ReviewViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/28/24.
//

import UIKit
import Kingfisher

class ReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet var mainTableView: UITableView!
    
    var guideList = TravelInfo().travel

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        let adadXib = UINib(nibName: "ReAdTableViewCell", bundle: nil)
        mainTableView.register(adadXib, forCellReuseIdentifier: "ReAdTableViewCell")
        let tourSpotXib = UINib(nibName: "ReTourTableViewCell", bundle: nil)
        mainTableView.register(tourSpotXib, forCellReuseIdentifier: "ReTourTableViewCell")
    }
    
    

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "ReTourTableViewCell", for: indexPath) as! ReTourTableViewCell
        let cell2 = tableView.dequeueReusableCell(withIdentifier: "ReAdTableViewCell", for: indexPath) as! ReAdTableViewCell
        
        let data = guideList[indexPath.row]
        
        if data.ad == true {
            cell2.configureCell(data: data)
            tableView.rowHeight = 120
            return cell2
        } else {
            tableView.rowHeight = 180
            cell1.configureCell(data: data)
            return cell1
        }
        
        
      

        
       
        
        
        
    }
}
