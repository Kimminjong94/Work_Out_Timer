//
//  RegisterNavigationVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/16.
//

import UIKit
import CLTypingLabel

class RegisterNavigationVC: UIViewController {
    @IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var registerLabel: UIButton!
    @IBOutlet weak var loginLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerLabel.layer.cornerRadius = 12
        loginLabel.layer.cornerRadius = 12

        
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = .white
        setCustomTitle()
        
        self.titleLabel.text = "Workout Timer"

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = true
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        self.navigationController?.navigationBar.isHidden = false
//    }
    
    //네비게이션바 텍스트 제거
    func setCustomTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterVC") as? RegisterVC else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(navigation, animated: true)
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC") as? LoginVC else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(navigation, animated: true)
    }
    
}
