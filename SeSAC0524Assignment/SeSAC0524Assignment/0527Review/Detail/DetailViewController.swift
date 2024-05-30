//
//  DetailViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/29/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data: Travel?

    @IBOutlet var selectedImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var favoriteLabel: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var buyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 화면"
        
        guard let name = data?.title else {return}
        titleLabel.text = "✈️ \(name)"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .left
        
        selectedImageView.kf.setImage(with: URL(string: data?.travel_image ?? "star"))
        selectedImageView.contentMode = .scaleAspectFill
       
        favoriteLabel.text = "⭐️ \(data?.grade ?? 0.0)﹒후기 \(data?.save?.formatted() ?? "0")개 "
        favoriteLabel.font = .systemFont(ofSize: 13)
        
        subtitle.font = .boldSystemFont(ofSize: 20)
        subtitle.text = "이런 곳이에요!"
        
        descriptionLabel.font = .boldSystemFont(ofSize: 18)
        descriptionLabel.text = "🙎‍♂️\n \(data?.description ?? "내용없음")"
        descriptionLabel.numberOfLines = 0
        
        buyButton.backgroundColor = .systemBlue
        buyButton.layer.cornerRadius = 5
        buyButton.setTitle("구매하기", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.titleLabel?.textAlignment = .center
        
    }
    
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BuyPageViewController") as! BuyPageViewController
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true)
        
    }
    
    


}
