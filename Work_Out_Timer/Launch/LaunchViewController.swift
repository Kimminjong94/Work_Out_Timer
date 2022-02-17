//
//  LaunchViewController.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/16.
//

import UIKit
import CLTypingLabel

class LaunchViewController: UIViewController {
    
    @IBOutlet weak var myTitle: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.myTitle.text = "Workout Timer"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        guard let navigation = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "BaseTabBarViewController") as? BaseTabBarViewController else { return }
        navigation.modalPresentationStyle = .overFullScreen
        self.present(navigation, animated: true)
    

    }

}
