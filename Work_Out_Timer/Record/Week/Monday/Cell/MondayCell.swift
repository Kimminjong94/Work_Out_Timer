//
//  MondayCell.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/11.

import UIKit

class MondayCell: UICollectionViewCell {
    @IBOutlet weak var mondayName: UITextField!
    @IBOutlet weak var mondayWeight: UITextField!
    @IBOutlet weak var mondaySet: UITextField!
    @IBOutlet weak var mondayTimes: UITextField!
    
//    var mondayWorkOutName = self.mondayName.text
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
