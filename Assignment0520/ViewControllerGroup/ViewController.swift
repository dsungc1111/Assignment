//
//  ViewController.swift
//  Assignment0520
//
//  Created by 최대성 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    
    @IBOutlet var topLogoLabel: UILabel!
    @IBOutlet var topMenuTvProgram: UILabel!
    @IBOutlet var topMenuMovie: UILabel!
    @IBOutlet var topMenuMyFavorite: UILabel!
    
    
    @IBOutlet var myContentButton: UIButton!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var infoButton: UIButton!
    
    @IBOutlet var previewLabel: UILabel!
    
    @IBOutlet var previewFirstImageView: UIImageView!
    @IBOutlet var previewSecondImageView: UIImageView!
    @IBOutlet var previewThirdImageView: UIImageView!
    @IBOutlet var topTenImageView1: UIImageView!

    @IBOutlet var topTenImageView2: UIImageView!

    @IBOutlet var topTenImageView3: UIImageView!
    
    
    
    let movies : [UIImage] = [.더퍼스트슬램덩크, .도둑들, .부산행, .스즈메의문단속, .아바타, .신과함께죄와벌, .신과함께인과연, .알라딘, .어벤져스엔드게임, .택시운전사]
    
    var previewContents: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        backgroundImage()
        topMenu()
        middleInfo()
        previewMovie()
    }

    func backgroundImage() {       
        let number = Int.random(in: 0...movies.count-1)
        backgroundImageView.image = movies[number]
        backgroundImageView.contentMode = .scaleAspectFit
    }
    func topMenu() {
        topLogoLabel.text = "N"
        topLogoLabel.textAlignment = .center
        topLogoLabel.font = .systemFont(ofSize: 60, weight: .bold, width: .expanded)
        topLogoLabel.textColor = .white
        
        labelStyle(topMenuTvProgram, wording: "Tv 프로그램")
        labelStyle(topMenuMovie, wording: "영화")
        labelStyle(topMenuMyFavorite, wording: "내가 찜한 컨텐츠")
    }
    func labelStyle(_ label: UILabel, wording: String) {
        label.text = wording
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13, weight: .bold, width: .expanded)
    }
    
    func middleInfo() {
        
        myContentButton.setImage(.check, for: .normal)
        myContentButton.setTitle("내가 찜한 컨텐츠", for: .normal)
        myContentButton.titleLabel?.font = UIFont(name: "폰트", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
        myContentButton.tintColor = .white
        
        playButton.setImage(.playNormal, for: .normal)
        playButton.contentMode = .scaleAspectFill
        
        infoButton.setImage(.info, for: .normal)
        infoButton.setTitle("정보", for: .normal)
        infoButton.titleLabel?.font = UIFont(name: "폰트", size: 14) ?? .systemFont(ofSize: 14, weight: .regular)
        infoButton.titleLabel?.textColor = .white
        infoButton.tintColor = .white
        
    }
    
    func previewMovie() {
        previewContents = movies
        previewLabel.text = "미리보기"
        previewLabel.textColor = .white
        
        
        randomMovie(previewFirstImageView)
        randomMovie(previewSecondImageView)
        randomMovie(previewThirdImageView)
        
    }
    
    func randomMovie(_ movie: UIImageView) {
        movie.contentMode = .scaleAspectFit
        let number = Int.random(in: 0...previewContents.count-1)
        movie.image = previewContents[number]
        previewContents.remove(at: number)
    }
    
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        backgroundImage()
        previewMovie()
        topTenMovie(badge: topTenImageView1)
        topTenMovie(badge: topTenImageView2)
        topTenMovie(badge: topTenImageView3)
        }
        
    
    
    func topTenMovie(badge: UIImageView) {
        let bool = Bool.random()
        if bool == true {
            badge.image = .top10Badge
            badge.contentMode = .scaleAspectFit
        } else {
            badge.image = .none
        }
        
    }
    
    
    
    
}

