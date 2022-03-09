//
//  MondayVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/10.
//

import UIKit
import Firebase

class MondayVC: UIViewController {
    
    @IBOutlet weak var mondayCV: UICollectionView!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var testSaveButton: UIButton!
    
    
    var ref: DocumentReference? = nil

    let db = Firestore.firestore()
    var messages: [Messages] = []
    
    var lineCount = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.plusButton.layer.cornerRadius = 12
        
        testSaveButton.layer.zPosition = 999

        
        let mondayCell = UINib(nibName: "TuesdayCell", bundle: nil)
        mondayCV.register(mondayCell, forCellWithReuseIdentifier: "TuesdayCell")
        
        mondayCV.delegate = self
        mondayCV.dataSource = self
        
    }
    
    func loadMessages() {
        
        db.collection("workoutName")
            .order(by: "date")
            .getDocuments { (querySnapshot, error) in
            
            self.messages = []

            if let e = error {
                print("error with Firestore \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data["sender"] as? String, let messageBody = data["name"] as? String {
                            let newMessage = Messages(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async() {
                                self.mondayCV.reloadData()
                            }
                            
                        }
                    }
                }
            }
        }
        
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        self.lineCount += 1
        let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
        self.mondayCV.scrollToItem(at: indexPath, at: .top, animated: true)
        mondayCV.reloadData()
    }
    @IBAction func testSave(_ sender: Any) {
        
        if let mondayName = MondayCell().mondayName?.text, let messageSender = Auth.auth().currentUser?.email {
            ref = db.collection("workoutName").addDocument(data: [
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
            }
        }
        presentAlert(title: "저장 완료", isCancelActionIncluded: false, handler: { action in
//            let splashStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            let splashViewController = splashStoryboard.instantiateViewController(identifier: "BaseTabBarViewController")
//            self.changeRootViewController(splashViewController)
        })
        
    }
}

extension MondayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return lineCount
//        default:
//            return lineCount
//        }
        if collectionView == self.mondayCV {
            return lineCount
        } else {
            return 2
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.mondayCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TuesdayCell", for: indexPath) as? TuesdayCell else {return UICollectionViewCell()}
            
            cell.tuesdayName.text = "hi"
            return cell

//            loadMessages()
        
//            cell.mondayName.text = messages[indexPath.row].body
//
//            if let mondayName = cell.mondayName.text, let mondayWeight = cell.mondayWeight.text, let mondaySet = cell.mondaySet.text, let mondayTimes = cell.mondayTimes.text, let messageSender = Auth.auth().currentUser?.email {
//                db.collection("workoutName").addDocument(data: [
//                    "sender": messageSender,
//                    "name": mondayName,
//                    "date": Date().timeIntervalSince1970
////                    "weight": mondayWeight,
////                    "set": mondaySet,
////                    "times": mondayTimes
//                ]) { (error) in
//                    if let e = error {
//                        print("there is error with firestore, \(e)")
//                    } else {
//                        print("success saving data")
//                    }
//                }}
//            return cell
//        } else {
//            return UICollectionViewCell()
//        }
        }
            return UICollectionViewCell()

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.mondayCV {
            return CGSize(width: self.mondayCV.bounds.width, height: 80)
        } else {
            return CGSize(width: 100, height: 100)
        }
    }
    
    
    
}

