
//  RecordVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/01/27

import UIKit
import Tabman
import Pageboy
import Firebase

class RecordVC: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    let db = Firestore.firestore()


    override func viewDidLoad() {
        super.viewDidLoad()

        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MondayVC") as! MondayVC
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TuesdayVC") as! TuesdayVC
        let vc4 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WednesdayVC") as! WednesdayVC
        let vc5 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThursdayVC") as! ThursdayVC
        let vc6 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FridayVC") as! FridayVC
        let vc7 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SaturdayVC") as! SaturdayVC
        let vc8 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SundayVC") as! SundayVC
            
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        viewControllers.append(vc5)
        viewControllers.append(vc6)
        viewControllers.append(vc7)
        viewControllers.append(vc8)

        
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
//        bar.layout.transitionStyle = .snap // Customize

        // Add to view
        addBar(bar, dataSource: self, at: .top)
        
        bar.backgroundView.style = .clear
        bar.layout.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        bar.buttons.customize { (button) in
                    button.tintColor = .systemGray
                    button.selectedTintColor = .black
                }
        
        bar.indicator.weight = .medium
        bar.indicator.tintColor = .black
        bar.indicator.overscrollBehavior = .compress
        bar.indicator.overscrollBehavior = .bounce
//        bar.layout.alignment = .centerDistributed
        bar.layout.contentMode = .fit
//        bar.layout.interButtonSpacing = 30
        bar.backgroundColor = .white
        configureItem()
        
    }
    private func configureItem() {
        navigationItem.title = "운동 기록"
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = true
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.isHidden = false
//    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if let mondayName = MondayCell().mondayName.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection("workoutName").addDocument(data: [
                "sender": messageSender,
                "name": mondayName,
                "date": Date().timeIntervalSince1970
//                    "weight": mondayWeight,
//                    "set": mondaySet,
//                    "times": mondayTimes
            ]) { (error) in
                if let e = error {
                    print("there is error with firestore, \(e)")
                } else {
                    print("success saving data")
                }
            }}
        

        
        presentAlert(title: "저장 완료", isCancelActionIncluded: false, handler: { action in
//            let splashStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let splashViewController = splashStoryboard.instantiateViewController(identifier: "BaseTabBarViewController")
//            self.changeRootViewController(splashViewController)
        })
    }}
    

extension RecordVC: PageboyViewControllerDataSource, TMBarDataSource {
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "월")
        case 1:
            return TMBarItem(title: "화")
        case 2:
            return TMBarItem(title: "수")
        case 3:
            return TMBarItem(title: "목")
        case 4:
            return TMBarItem(title: "금")
        case 5:
            return TMBarItem(title: "토")
        case 6:
            return TMBarItem(title: "일")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
