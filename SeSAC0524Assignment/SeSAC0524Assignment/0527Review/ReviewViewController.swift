//
//  ReviewViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/28/24.
//

import UIKit
import Kingfisher

class ReviewViewController: UIViewController {
   
    
    @IBOutlet var mainTableView: UITableView!
    
    var guideList = TravelInfo().travel
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        let adadXib = UINib(nibName: ReAdTableViewCell.identifier, bundle: nil)
        mainTableView.register(adadXib, forCellReuseIdentifier: ReAdTableViewCell.identifier)
        let tourSpotXib = UINib(nibName: ReTourTableViewCell.identifier, bundle: nil)
        mainTableView.register(tourSpotXib, forCellReuseIdentifier: ReTourTableViewCell.identifier)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    

    

  
}


extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guideList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        let data = guideList[indexPath.row]
        
        if data.ad {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReAdTableViewCell.identifier, for: indexPath) as? ReAdTableViewCell else { return ReAdTableViewCell() }
            cell.configureCell(data: data)
           
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ReTourTableViewCell.identifier, for: indexPath) as? ReTourTableViewCell else { return ReTourTableViewCell() }
           
            cell.configureCell(data: data)
            return cell
        }

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = guideList[indexPath.row]
        
        if data.ad {
            return 120
        } else {
            return 180
        }
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = guideList[indexPath.row]
        
        if data.ad {
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: AdViewController.identifier) as? AdViewController else {return}
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            
            vc.dataAd = guideList[indexPath.row]
            
            present(nav, animated: true)
        } else {
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            guard let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as? DetailViewController else { return }

           
            vc.data = guideList[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}


    

