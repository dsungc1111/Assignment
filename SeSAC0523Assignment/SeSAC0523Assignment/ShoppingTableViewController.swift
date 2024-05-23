//
//  ShoppingTableViewController.swift
//  SeSAC0523Assignment
//
//  Created by 최대성 on 5/23/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var searchBoxTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var things = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = "쇼핑"
        categoryLabel.textAlignment = .center
        categoryLabel.font = .boldSystemFont(ofSize: 20)
        searchBoxTextField.placeholder = "무엇을 구매하실건가요?"
        searchBoxTextField.layer.cornerRadius = 10
        searchBoxTextField.backgroundColor = .systemGray5
        addButton.setTitle("추가", for: .normal)
        addButton.backgroundColor = .gray
        addButton.layer.cornerRadius = 5
        addButton.setTitleColor(.black, for: .normal
        )
        
    }
    
    // 섹션, 행, 데이터
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dsungc")!
        cell.textLabel?.text = things[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 12)
        cell.imageView?.image = .checkmark
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
  
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
    }
    
    
    
    
    
}
