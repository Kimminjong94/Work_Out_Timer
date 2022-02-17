//
//  LoginNavigationVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/16.
//

import UIKit

class LoginNavigationVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MyInfoVC") as? MyInfoVC else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.pushViewController(navigation, animated: true)


    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    



}
