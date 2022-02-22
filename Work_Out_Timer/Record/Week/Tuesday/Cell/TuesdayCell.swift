//
//  TuesdayCell.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/21.
//

import UIKit

class TuesdayCell: UICollectionViewCell {
    
    var delegate : ViewControllerDelegate?
    
    var currentIdx: Int = 0


    
    @IBOutlet weak var tuesdayName: UITextField!
    @IBOutlet weak var tuesdayWeight: UITextField!
    @IBOutlet weak var tuesdaySet: UITextField!
    @IBOutlet weak var tuesdayTimes: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tuesdayName.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    
    /* 텍스트필드의 값이 변경될 때 */
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.sendData(data: textField, idx: currentIdx)
    }

}
