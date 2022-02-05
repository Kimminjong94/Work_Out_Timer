//
//  LaunchVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/04.
//

import UIKit
import CLTypingLabel


class LaunchVC: UIViewController {
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "Workout Timer"

    }

}
