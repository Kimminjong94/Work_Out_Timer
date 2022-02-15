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
    
    let db = Firestore.firestore()
    
    var lineCount = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.plusButton.layer.cornerRadius = 12

        
        let mondayCell = UINib(nibName: "MondayCell", bundle: nil)
        mondayCV.register(mondayCell, forCellWithReuseIdentifier: "MondayCell")
        
        mondayCV.delegate = self
        mondayCV.dataSource = self
    }
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        self.lineCount += 1
        mondayCV.reloadData()
    }
}

extension MondayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.mondayCV {
            return self.lineCount
        } else {
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mondayCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MondayCell", for: indexPath) as? MondayCell else {return UICollectionViewCell()}
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.mondayCV {
            return CGSize(width: self.mondayCV.bounds.width, height: 80)
        } else {
            return CGSize(width: 100, height: 100)
        }
            
     
    }
    
    
    
}

