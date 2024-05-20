//
//  HomeViewController.swift
//  Assignment0520
//
//  Created by 최대성 on 5/20/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var idTextField: UITextField!
    @IBOutlet var nickNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var infoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        

        loginWindow(idTextField, loginWindowContent: "id 혹은 e-mail을(를) 입력하세요")
        loginWindow(nickNameTextField, loginWindowContent: "닉네임을 입력하세요.")
        loginWindow(passwordTextField, loginWindowContent: "비밀번호를 입력하세요.")
        loginWindow(infoTextField, loginWindowContent: "추가 정보 입력")
        signInButtonShape()
    }
    
    func loginWindow(_ box: UITextField, loginWindowContent text: String) {
        box.becomeFirstResponder()
        box.layer.borderWidth = 1
        box.backgroundColor = .gray
        box.text = text
        box.textColor = .white
        box.textAlignment = .center
        box.clearButtonMode = .always
        if box == infoTextField {
            box.textAlignment = .left
            box.textColor = .white
            box.backgroundColor = .black
        }
    }
    
    func signInButtonShape() {
        signInButton.layer.borderColor = UIColor.white.cgColor
        signInButton.layer.borderWidth = 1
    }

    
    
    @IBAction func keyboardButtonTapped(_ sender: UIButton) {
        view.endEditing(true)
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    

}
