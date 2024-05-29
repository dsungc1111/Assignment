//
//  PopularCityViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/29/24.
//

import UIKit
import Kingfisher

class PopularCityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list = CityInfo().city
    var newList = CityInfo().city
    @IBOutlet var travelSegmentedControl: UISegmentedControl!
    var anotherList: [City] = []
    
    @IBOutlet var cityTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.rowHeight = 190
        cityTableView.delegate = self
        cityTableView.dataSource = self
        let xib = UINib(nibName: PopularCityTableViewCell.identifier, bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: PopularCityTableViewCell.identifier)
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PopularCityTableViewCell", for: indexPath) as! PopularCityTableViewCell
        
        let data = list[indexPath.row]
        
        cell.configureCell(data: data)
        
        
        
        
        return cell
    }
    

    
    @IBAction func segmentedConrolUsed(_ sender: UISegmentedControl) {
        anotherList = []
        list = newList
        if sender.selectedSegmentIndex == 1 {
            for item in list {
                if item.domestic_travel == true {
                    anotherList.append(item)
                }
            }
        } else if sender.selectedSegmentIndex == 2 {
            for item in list {
                if item.domestic_travel == false {
                    anotherList.append(item)
                }
            }
        } else {
            anotherList = list
        }
        list = anotherList
        
        cityTableView.reloadData()
        
        
    }
    
    
    
    
}
