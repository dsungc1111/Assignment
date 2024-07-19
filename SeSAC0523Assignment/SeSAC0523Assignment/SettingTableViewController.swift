//
//  SettingTableViewController.swift
//  SeSAC0523Assignment
//
//  Created by 최대성 on 5/23/24.
//

import UIKit
import SnapKit


class SettingViewController: UIViewController {

    let sectionName = ["전체 설정", "개인 설정", "기타"]
    let settingMenu = [["공지사항", "실험실", "버전 정보"],["개인/보안", "알림", "채팅", "멀티프로필"] ,["고객센터/도움말"]]
    var dataSource: UICollectionViewDiffableDataSource<String,String>!
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .grouped)
        configuration.backgroundColor = .white
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    private func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, String>!
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            // collectionviewCell's system cell
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier
            content.textProperties.font = .boldSystemFont(ofSize: 20)
            cell.contentConfiguration = content
            
            var backgroundConfig = UIBackgroundConfiguration.listGroupedCell()
            backgroundConfig.backgroundColor = .clear
            backgroundConfig.cornerRadius = 10
            cell.backgroundConfiguration = backgroundConfig
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier )
            
            return cell
        })
      
        
     
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        configureDataSource()
        updateSnapShot()
        
    }

    
    func updateSnapShot() {
        var snapShot = NSDiffableDataSourceSnapshot<String,String>()
        
        snapShot.appendSections(sectionName)
        snapShot.appendItems(settingMenu[0], toSection: sectionName[0])
        snapShot.appendItems(settingMenu[1], toSection: sectionName[1])
        snapShot.appendItems(settingMenu[2], toSection: sectionName[2])
        
        dataSource.apply(snapShot) // reloadData
    }

}

