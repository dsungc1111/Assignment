//
//  TravelActivityTableViewController.swift
//  PracticeFile
//
//  Created by 최대성 on 5/25/24.
//

import UIKit


struct Travel {
    let country: String
    let money: Int
    var like: Bool
}

class TravelActivityTableViewController: UITableViewController {

    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var searchFieldUIView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    var list = [Travel(country: "프랑스", money: 100000000, like: true),
                Travel(country: "england", money: 1000000000, like: false),
                Travel(country: "japan", money: 1000000, like: false),
                Travel(country: "USA", money: 10000000000, like: false),
                ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black        //셀이 아닌 애들은 uiview 위에 놓기
        titleLabel.text = "즐길 거리"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 15)
        
      
        searchFieldUIView.backgroundColor = .white
        searchFieldUIView.layer.cornerRadius = 10
        searchTextField.layer.borderWidth = 1
        searchTextField.placeholder = "도시명/액티비티로 검색"
        
        
        searchButton.backgroundColor = .red
        searchButton.setTitle("검색하기", for: .normal)
        searchButton.layer.cornerRadius = 20
        searchButton.setTitleColor(.white, for: .normal)
        tableView.rowHeight = 100
    }

    
    //섹션 > 없으면 안해도됨
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        <#code#>
//    }
//    
    
    
    
    //행
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    // 데이터 표현
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelActivityTableViewCell") as! TravelActivityTableViewCell
        let data = list[indexPath.row]
        
        
        cell.posterLabelOne.text = data.country
        cell.posterLabelOne.font = .boldSystemFont(ofSize: 12)
        
        cell.posterLabelTwo.text = data.money.formatted()
        cell.posterLabelTwo.font = .boldSystemFont(ofSize: 12)
        
        let like = data.like ? "heart.fill" : "heart"
        let image = UIImage(systemName: like)
        
        cell.likeButton.setImage(image, for: .normal)
        
        
        
        
        
        
        
        return cell
    }
    
    
    
    
   
}
