//
//  RegisterVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/05.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        registerButton.layer.cornerRadius = 12
        
        self.registerButton.isEnabled = false
        self.passwordTextfield.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)

    }
    
    @objc func textFieldDidChange(_ sender: Any?) {
        self.registerButton.isEnabled = true
        self.registerButton.backgroundColor = UIColor.black
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - 회원가입 버튼 클릭 시 이벤트
    @IBAction func registerPressed(_ sender: Any) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "BaseTabBarViewController") as? BaseTabBarViewController else { return }
                navigation.modalPresentationStyle = .overFullScreen
                self.present(navigation, animated: true, completion: nil)
                
            }
        }
        }
    }
    
}
