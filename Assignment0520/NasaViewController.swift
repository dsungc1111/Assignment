//
//  NasaViewController.swift
//  Assignment0520
//
//  Created by 최대성 on 7/1/24.
//

import UIKit
import SnapKit

class NasaViewController: UIViewController {

    enum Nasa: String, CaseIterable {
        
        static let baseURL = "https://apod.nasa.gov/apod/image/"
        
        case one = "2308/sombrero_spitzer_3000.jpg"
        case two = "2212/NGC1365-CDK24-CDK17.jpg"
        case three = "2307/M64Hubble.jpg"
        case four = "2306/BeyondEarth_Unknown_3000.jpg"
        case five = "2307/NGC6559_Block_1311.jpg"
        case six = "2304/OlympusMons_MarsExpress_6000.jpg"
        case seven = "2305/pia23122c-16.jpg"
        case eight = "2308/SunMonster_Wenz_960.jpg"
        case nine = "2307/AldrinVisor_Apollo11_4096.jpg"
         
        static var photo: URL {
            return URL(string: Nasa.baseURL + Nasa.allCases.randomElement()!.rawValue)!
        }
    }
    
    lazy var requestButton = {
        let btn = UIButton()
        btn.addTarget(self, action: #selector(progressButtonTapped), for: .touchUpInside)
        return btn
    }()
    let progressLabel = UILabel()
    let nasaImageView = UIImageView()
    var session: URLSession!
    var total = 0.0
    var buffer = Data() {
        didSet {
            let result = Double(buffer.count) / total
            let stringResult = String(format: "%.2f", result*100)
            progressLabel.text = "\(stringResult) / 100"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()
    }
    @objc func progressButtonTapped() {
        
        callRequest()
    }
    
    func callRequest() {
        print(Nasa.photo)
        let request = URLRequest(url: Nasa.photo)
        session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.dataTask(with: request).resume()
    }
    func configureHierarchy() {
        view.addSubview(requestButton)
        view.addSubview(progressLabel)
        view.addSubview(nasaImageView)
    }
    func configureLayout() {
        requestButton.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(80)
        }
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(requestButton.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(80)
        }
        nasaImageView.snp.makeConstraints { make in
            make.top.equalTo(progressLabel.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    func configureView() {
        requestButton.backgroundColor = .systemBlue
        progressLabel.backgroundColor = .systemGray
        nasaImageView.backgroundColor = .orange
    }
}
extension NasaViewController: URLSessionDataDelegate {
    //response, data, error
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse) async -> URLSession.ResponseDisposition {
        if let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) {
            
            let contentLength = response.value(forHTTPHeaderField: "Content-Length")
            
            total = Double(contentLength ?? "0") ?? 0.0
            
            return .allow
        } else {
            return .cancel
        }
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        buffer.append(data)
    }
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: (any Error)?) {
        if let error = error {
            let image = UIImage(systemName: "star.fill")
            nasaImageView.image = image
            progressLabel.text = "error"
        } else {
            
            progressLabel.text = "완료!"
            
            let image = UIImage(data: buffer)
            nasaImageView.image = image
        }
    }
}
