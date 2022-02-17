//
//  MyInfoVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/17.
//

import UIKit
import Firebase

class MyInfoDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            //팝루트뷰컨트롤러 가능하면 사용하기 왜냐하면 스택을 다 지우고 처음ㅇ화면으로 돌아가기 때문
//            navigationController?.popViewController(animated: true)
            
            print("Error signing out: %@", signOutError)
        }
        
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "BaseTabBarViewController") as? BaseTabBarViewController else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.present(navigation, animated: true, completion: nil)
    }
}
