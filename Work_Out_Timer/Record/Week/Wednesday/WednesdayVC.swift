////
////  WednesdayVC.swift
////  Work_Out_Timer
////
////  Created by 김민종 on 2022/02/10.
////
//
import UIKit
import Firebase
import IQKeyboardManagerSwift

class WednesdayVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wednesCell = UINib(nibName: "TuesdayCell", bundle: nil)
        wednesCV.register(wednesCell, forCellWithReuseIdentifier: "TuesdayCell")
        
        wednesCV.delegate = self
        wednesCV.dataSource = self
        
//        setData()
        self.wednesCV.reloadData()
        

    }
}
