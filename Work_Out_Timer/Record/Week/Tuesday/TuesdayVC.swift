//
//  TuesdayVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/10.
//

import UIKit
import Firebase

protocol ViewControllerDelegate {
    func sendData(data: UITextField!, idx: Int)
}

extension TuesdayVC: ViewControllerDelegate {
    func sendData(data: UITextField!, idx: Int) {
//        currentData[idx] = data.text ?? ""
    }
}

class TuesdayVC: UIViewController {
    var currentData: [String] = []
    
    var lineCount = 2

    
    
    @IBOutlet weak var tuesdayCV: UICollectionView!
    
    let db = Firestore.firestore()
    
//    var name: String = TuesdayCell().tuesdayName.text!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mondayCell = UINib(nibName: "TuesdayCell", bundle: nil)
        tuesdayCV.register(mondayCell, forCellWithReuseIdentifier: "TuesdayCell")
        
        tuesdayCV.delegate = self
        tuesdayCV.dataSource = self
        
        setData()
        loadMessages()
        self.tuesdayCV.reloadData()


    }
    func setData(){
        currentData = ["","",""]
        tuesdayCV.reloadData()
    }
    //MARK: - Firebase에서 데이터 불러오기
    func loadMessages() {
        
        db.collection("workoutName")
            .order(by: "date")
            .getDocuments { (querySnapshot, error) in
            
            self.currentData = []

            if let e = error {
                print("error with Firestore \(e)")
            } else {
                
                
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data["sender"] as? String, let messageBody = data["name"] as? String {
                            let newMessage = Messages(sender: messageSender, body: messageBody)
                            
                            
                            DispatchQueue.main.async() {
                                self.tuesdayCV.reloadData()
                            }
                            
                            // 배열에 데이터 추가하기 해보기 깃 에러 처리
                            self.currentData = [newMessage.body]

                        }
                    }
                }
            }
        }
        
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        
        self.lineCount += 1
        let indexPath = IndexPath(row: self.currentData.count - 1, section: 0)
        self.tuesdayCV.scrollToItem(at: indexPath, at: .top, animated: true)
        tuesdayCV.reloadData()
        
    }
    
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
//        print(TuesdayCell().tuesdayName?.text)
        print("\(currentData)")
        
        //배열로 저장
        
        if let messageSender = Auth.auth().currentUser?.email {
            db.collection("workoutName").addDocument(data: [
                "sender": messageSender,
                "name": currentData,
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
    }
    
}

extension TuesdayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return lineCount
        default:
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.tuesdayCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TuesdayCell", for: indexPath) as? TuesdayCell else {return UICollectionViewCell()}
            
            cell.currentIdx = indexPath.row
            cell.delegate = self
            return cell
        }
            return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.tuesdayCV {
            return CGSize(width: self.tuesdayCV.bounds.width, height: 80)
        } else {
            return CGSize(width: 100, height: 100)
        }
    }
}
