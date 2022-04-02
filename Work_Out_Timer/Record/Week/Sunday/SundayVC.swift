//
//  SundayVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/10.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

class SundayVC: UIViewController {
    
    @IBOutlet weak var sundayTV: UITableView!
    @IBOutlet weak var sundayName: UITextField!
    
    let db = Firestore.firestore()
    var currentData: [Messages] = []
    var documentID: String = ""
    var lineCount = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sundayTV.register(UINib(nibName: "SundayCell", bundle: nil), forCellReuseIdentifier: "SundayCell")
        
        sundayTV.delegate = self
        sundayTV.dataSource = self
        
        self.sundayTV.reloadData()
        loadMessages()

        
        
        sundayTV.allowsMultipleSelectionDuringEditing = true

    }
    
    //MARK: - Firebase에서 데이터 불러오기
    func loadMessages() {
        
        let myRef = self.db.collection("Sunday")
        let tempId = myRef.document().documentID
        
        myRef.document(tempId).collection("sundaySub")
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
                            let messageBody = data["name"] as? String,
                            let messagedcoumentID = data["documentID"] as? String {
                            let newMessage = Messages(sender: messageSender, body: messageBody, documentID: messagedcoumentID)
//                            self.currentData = [messageBody]
//                            self.currentData = [newMessage.body]
                            DispatchQueue.main.async() {
                                self.currentData.append(newMessage)
                                self.sundayTV.reloadData()
                                let indexPath = IndexPath(row: self.currentData.count - 1, section: 0)
                                self.sundayTV.scrollToRow(at: indexPath, at: .top, animated: false)
                             }
                        }
                    }
                }
            }
        }
        
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        
        let myRef = self.db.collection("Sunday")
        let tempId = myRef.document().documentID
        
        if let messageSender = Auth.auth().currentUser?.email, let messageeBody = sundayName?.text {
            db.collection("Sunday").document(tempId).collection("sundaySub").addDocument(data: [
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
                        self.sundayName.text = ""
                    }
                }
            }
        }
    }
    
    func saveData(spot: Messages, completion: @escaping (Bool) -> ()) {
        let db = Firestore.firestore()
        
        if self.documentID == "" {
//            var ref = DocumentReference? = nil
            if let messageSender = Auth.auth().currentUser?.email, let messageeBody = sundayName?.text {
                db.collection("Sunday").document(spot.documentID).collection("sundaySub").addDocument(data: [
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
                            self.sundayName.text = ""
                        }
                    }
                }
        }
    }
    }
    
}

extension SundayVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return currentData.count
        default:
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = sundayTV.dequeueReusableCell(withIdentifier: "SundayCell", for: indexPath) as! SundayCell
        cell.sundayName.text = currentData[indexPath.row].body
        
//        let myRef = self.db.collection("Sunday")
//        let tempId = myRef.document().documentID
        
//        print(tempId)

//        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            sundayTV.beginUpdates()
            
            //
            let myRef = self.db.collection("Sunday")
            let tempId = myRef.document().documentID
            
            print(tempId)

            myRef.document(tempId).collection("sundaySub").document(tempId).delete() { err in
            if let err = err {
              print("Error removing document: \(err)")
            }
            else {
              print("Document successfully removed!")
            }
          }
            currentData.remove(at: indexPath.row)
            sundayTV.deleteRows(at: [indexPath], with: .fade)
            sundayTV.endUpdates()
        }
    }
    
    
}

