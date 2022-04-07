//
//  TuesdayCell.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/21.
//

import UIKit
import SwipeCellKit

class TuesdayCell: SwipeCollectionViewCell {
    
//    var delegate : UICollectionViewDelegate?
    
//    var currentIdx: Int = 0


    
    @IBOutlet weak var tuesdayName: UITextField!
    @IBOutlet weak var tuesdayWeight: UITextField!
    @IBOutlet weak var tuesdaySet: UITextField!
    @IBOutlet weak var tuesdayTimes: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    

}
