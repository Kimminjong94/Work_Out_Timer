//
//  SettingVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/01/27.
//

import UIKit
import Firebase

class MyInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .black
        self.view.backgroundColor = .white
        setCustomTitle()
    }
    
    //네비게이션바 텍스트 제거
    func setCustomTitle() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func goToLogin(_ sender: Any) {
        
        if Auth.auth().currentUser?.email == nil {
            guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RegisterNavigationVC") as? RegisterNavigationVC else { return }
            navigation.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(navigation, animated: true)
        } else if Auth.auth().currentUser?.email != nil {
            guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MyInfoDetailVC") as? MyInfoDetailVC else { return }
            navigation.modalPresentationStyle = .overFullScreen
            self.navigationController?.pushViewController(navigation, animated: true)
        }
        
        
        
    }
    @IBAction func goToVersion(_ sender: Any) {
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "VersionVC") as? VersionVC else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(navigation, animated: true)
    }
    
}
