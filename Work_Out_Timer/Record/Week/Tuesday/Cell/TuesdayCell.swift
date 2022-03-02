//
//  TuesdayCell.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/21.
//

import UIKit
import SwipeCellKit

class TuesdayCell: UICollectionViewCell {
    
    var delegate : UICollectionViewDelegate?
    
//    var currentIdx: Int = 0


    
    @IBOutlet weak var tuesdayName: UITextField!
    @IBOutlet weak var tuesdayWeight: UITextField!
    @IBOutlet weak var tuesdaySet: UITextField!
    @IBOutlet weak var tuesdayTimes: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        tuesdayName.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func collectionView(_ collectionView: UICollectionView, editActionsForItemAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            // handle action by updating model with deletion
        }

//         customize the action appearance
        deleteAction.image = UIImage(named: "delete")

        return [deleteAction]
    }
    

    
    
//    /* 텍스트필드의 값이 변경될 때 */
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        delegate?.sendData(data: textField, idx: currentIdx)
//    }

}
