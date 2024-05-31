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

    
        imageSet()
        textSet()
        buttonSet()
            
    }
    
    
    func imageSet() {
        selectedImageView.kf.setImage(with: URL(string: data?.travel_image ?? "star"))
        selectedImageView.contentMode = .scaleAspectFill
    }
    
    
    
    func textSet() {
        favoriteLabel.text = "⭐️ \(data?.grade ?? 0.0)﹒후기 \(data?.save?.formatted() ?? "0")개 "
        favoriteLabel.font = .systemFont(ofSize: 13)
        
        guard let name = data?.title else {return}
        titleLabel.text = "✈️ \(name)"
        titleLabel.font = .boldSystemFont(ofSize: 30)
        titleLabel.textAlignment = .left
        
        subtitle.font = .boldSystemFont(ofSize: 20)
        subtitle.text = "이런 곳이에요!"
        
        descriptionLabel.font = .boldSystemFont(ofSize: 18)
        descriptionLabel.text = "🙎‍♂️\n \(data?.description ?? "내용없음")"
        descriptionLabel.numberOfLines = 0
    }
    
    
    func buttonSet() {
        buyButton.backgroundColor = .systemBlue
        buyButton.layer.cornerRadius = 5
        buyButton.setTitle("구매하기", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.titleLabel?.textAlignment = .center
    }
    
    
    
    
    
    
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Detail", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as? BuyPageViewController else { return }
        let nav = UINavigationController(rootViewController: vc)
        
        present(nav, animated: true)
        
    }
    
    


}

extension DetailViewController: IdentifierProtocol {
    static var identifier: String {
        return String(describing: BuyPageViewController.self)
    }
    
    
}
