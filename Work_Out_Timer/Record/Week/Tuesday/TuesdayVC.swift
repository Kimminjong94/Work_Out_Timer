//
//  TuesdayVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/10

import UIKit
import Firebase
import SwipeCellKit

class TuesdayVC: UIViewController {
    
    @IBOutlet weak var tuesdayCV: UICollectionView!
    @IBOutlet weak var tuesdayName: UITextField!
    
    let db = Firestore.firestore()
    var currentData: [Messages] = []
    var lineCount = 2
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tuesdayCell = UINib(nibName: "TuesdayCell", bundle: nil)
        tuesdayCV.register(tuesdayCell, forCellWithReuseIdentifier: "TuesdayCell")
        
        tuesdayCV.delegate = self
        tuesdayCV.dataSource = self
        
//        setData()
        loadMessages()
        self.tuesdayCV.reloadData()
        
        
        tuesdayCV.allowsMultipleSelectionDuringEditing = true


    }

    //MARK: - Firebase에서 데이터 불러오기
    func loadMessages() {
        
        let myRef = self.db.collection("Tuesday")
        let tempId = myRef.document().documentID
        
        db.collection("Tuesday").document(tempId).collection("tuesdaySub")
            .order(by: "date")
            .addSnapshotListener { (querySnapshot, error) in
            
            self.currentData = []

            if let e = error {
                print("error with Firestore \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data["sender"] as? String,
                            let messageBody = data["name"] as? String {
                            let newMessage = Messages(sender: messageSender, body: messageBody)
//                            self.currentData = [messageBody]
//                            self.currentData = [newMessage.body]
                            DispatchQueue.main.async() {
                                self.currentData.append(newMessage)
                                self.tuesdayCV.reloadData()
                                let indexPath = IndexPath(row: self.currentData.count - 1, section: 0)
                                self.tuesdayCV.scrollToItem(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
        
    }
    
//    @IBAction func plusButtonPressed(_ sender: Any) {
//
//        self.lineCount += 1
//        let indexPath = IndexPath(row: self.currentData.count - 1, section: 0)
//        self.tuesdayCV.scrollToItem(at: indexPath, at: .top, animated: true)
//        tuesdayCV.reloadData()
//
//    }

    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let myRef = self.db.collection("Tuesday")
        let tempId = myRef.document().documentID
        
//        print(TuesdayCell().tuesdayName?.text)
//        print("\(currentData)")
        if let messageSender = Auth.auth().currentUser?.email, let messageeBody = tuesdayName?.text {
            db.collection("Tuesday").document(tempId).collection("tuesday").addDocument(data: [
                "sender": messageSender,
                "name": messageeBody ?? "",
                "date": Date().timeIntervalSince1970
//                    "weight": mondayWeight,
//                    "set": mondaySet,
//                    "times": mondayTimes
            ]) { (error) in
                if let e = error {
                    print("there is error with firestore, \(e)")
                } else {
                    print("success saving data")
                    
                    DispatchQueue.main.async {
                        self.tuesdayName.text = ""
                    }
                }
            }
        }
    }
    
}
//MARK: - collectionviewcell

extension TuesdayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return currentData.count
        default:
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.tuesdayCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TuesdayCell", for: indexPath) as? TuesdayCell else {return UICollectionViewCell()}
//            cell.currentIdx = indexPath.row
//            cell.delegate = self
            cell.tuesdayName.text = currentData[indexPath.row].body ?? ""
            cell.delegate = self
//            print(self.db.collection("Tuesday").document().documentID)
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

//MARK: - SwipeCellKit - delete collectionviewcell library

extension TuesdayVC: SwipeCollectionViewCellDelegate {
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        


        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            

            self.currentData.remove(at: indexPath.row)
            self.tuesdayCV.reloadData()
            
            let myRef = self.db.collection("Tuesday")
            let tempId = myRef.document().documentID
            
            print(tempId)

            myRef.document("\(tempId)").delete() { err in
            if let err = err {
              print("Error removing document: \(err)")
            }
            else {
              print("Document successfully removed!")
            }
          }
            

        }
        deleteAction.image = UIImage(named: "delete")
        return [deleteAction]
        
        
    }

    func collectionView(_ collectionView: UICollectionView, editActionsOptionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
        
        
    }
    
    func deleteMessage(message: Messages) {

    }

}
