//
//  ShoppingTableViewController.swift
//  SeSAC0523Assignment
//
//  Created by 최대성 on 5/23/24.
//

import UIKit

struct Shopping {
    var check: Bool
    let todo: String
    var bookmark: Bool
}


class ShoppingTableViewController: UITableViewController {

    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var searchBoxTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var things = [Shopping(check: false, todo: "그립톡 구매하기", bookmark: false),
                  Shopping(check: false, todo: "사이다 구매", bookmark: false),
                  Shopping(check: false, todo: "아이패드 케이스 최저가 알아보기", bookmark: false),
                  Shopping(check: false, todo: "양말", bookmark: false)
                ]
    
    
  //  ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        categoryLabel.text = "쇼핑"
        categoryLabel.textAlignment = .center
        categoryLabel.font = .boldSystemFont(ofSize: 20)
        searchBoxTextField.placeholder = "무엇을 구매하실건가요?"
        searchBoxTextField.layer.cornerRadius = 10
        searchBoxTextField.backgroundColor = .systemGray5
        addButton.setTitle("추가", for: .normal)
        addButton.backgroundColor = .gray
        addButton.layer.cornerRadius = 5
        addButton.setTitleColor(.black, for: .normal)
        
    }
    
    @objc func checkButtonTapped(sender: UIButton) {
        things[sender.tag].check.toggle()
        //tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func bookmarkButtonTapped(sender: UIButton) {
        things[sender.tag].bookmark.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
        
    }
    
    
    // 섹션, 행, 데이터
    
  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell") as! ShoppingTableViewCell
        //checkmark.rectangle.portrait
        //checkmark.square.fill
        let data = things[indexPath.row]
        
        
        
        let check = data.check ? "checkmark.square.fill" : "checkmark.square"
        let imageCheck = UIImage(systemName: check)
        
        cell.checkButton.tag = indexPath.row
        cell.checkButton.setImage(imageCheck, for: .normal)
        
        cell.checkButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        
        
       
        cell.todoLabel.text = data.todo
        cell.todoLabel.textAlignment = .left
        
        let star = data.bookmark ? "star.fill" : "star"
        let image = UIImage(systemName: star)
        
        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.setImage(image, for: .normal)
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        return cell
    }
  
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        guard let text = searchBoxTextField.text, text.count > 1 else {
            searchBoxTextField.text = "다시 입력해주세요."
            return
        }

        let addThings = Shopping(check: false, todo: searchBoxTextField.text!, bookmark: false)
        things.append(addThings)
        
        searchBoxTextField.text = ""
        tableView.reloadData()
    }
    
    
    
    
    
}
