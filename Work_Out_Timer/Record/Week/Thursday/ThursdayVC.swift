//
//  ThursdayVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/10.
//

import UIKit

class ThursdayVC: UIViewController {
    
    var currentData: [Messages] = []


    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

//extension ThursdayVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        switch section {
//        case 0:
//            return currentData.count
//        default:
//            return 0
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        if collectionView == self.thursdayCV {
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TuesdayCell", for: indexPath) as? TuesdayCell else {return UICollectionViewCell()}
////            cell.currentIdx = indexPath.row
////            cell.delegate = self
//            cell.thursdayName.text = currentData[indexPath.row].body ?? ""
//            cell.delegate = self
//            return cell
//        }
//            return UICollectionViewCell()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if collectionView == self.thursdayCV {
//            return CGSize(width: self.thursdayCV.bounds.width, height: 80)
//        } else {
//            return CGSize(width: 100, height: 100)
//        }
//    }
//}
