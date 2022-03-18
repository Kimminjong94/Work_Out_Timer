//
//  SundayCell.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/03/17.
//

import UIKit

class SundayCell: UITableViewCell {
    
    @IBOutlet weak var sundayName: UILabel!
    
    @IBOutlet weak var sundayWeight: UILabel!
    @IBOutlet weak var sundaySet: UILabel!
    @IBOutlet weak var sundayTimes: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
