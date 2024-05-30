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
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
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
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = guideList[indexPath.row]
        
        if data.ad {
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AdViewController") as! AdViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        } else {
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController

           
            vc.data = guideList[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
