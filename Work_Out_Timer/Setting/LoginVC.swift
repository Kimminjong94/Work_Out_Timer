//
//  LoginVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/05.

import UIKit
import Firebase

class LoginVC: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func LoginPressed(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let  e = error {
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
