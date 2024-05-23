//
//  SettingTableViewController.swift
//  SeSAC0523Assignment
//
//  Created by 최대성 on 5/23/24.
//

import UIKit

class SettingTableViewController: UITableViewController {

    let sectionName = ["전체 설정", "개인 설정", "기타"]
    let settingMenu = [["공지사항", "실험실", "버전 정보"],["개인/보안", "알림", "채팅", "멀티프로필"] ,["고객센터/도움말"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // 1. 섹션 개수 설정
    // 2. 행 개수 설정
    // 3. 데이터 표현
    
    // 1. 섹션 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionName.count
    }
    // 2.  행개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingMenu[section].count
    }
    
    // 3. 데이터 표현
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dsungC", for: indexPath)
        cell.textLabel?.text = settingMenu[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 12)
        return cell
    }
    
    // 4. 헤더 입력
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return sectionName[section]
        } else if section == 1 {
            return sectionName[section]
        } else {
            return "기타"
        }
    }

    
    
    
    //section 1의 셀 - 개수
    

}
