//
//  TuesdayVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/10.
//

import UIKit
import Firebase

class TuesdayVC: UIViewController {
    @IBOutlet weak var tuesdayCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let mondayCell = UINib(nibName: "TuesdayCell", bundle: nil)
        tuesdayCV.register(mondayCell, forCellWithReuseIdentifier: "TuesdayCell")
        
        tuesdayCV.delegate = self
        tuesdayCV.dataSource = self

    }
    @IBAction func plusButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
    }
    
}

extension TuesdayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView == self.tuesdayCV {
            return 2
        } else {
            return 2
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.tuesdayCV {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TuesdayCell", for: indexPath) as? TuesdayCell else {return UICollectionViewCell()}
            
            cell.tuesdayName.text = "hi"
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

