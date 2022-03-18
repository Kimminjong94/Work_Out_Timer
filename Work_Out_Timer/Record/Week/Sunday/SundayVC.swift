//
//  SundayVC.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/02/10.
//

import UIKit

class SundayVC: UIViewController {
    
    @IBOutlet weak var sundayTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sundayTV.register(UINib(nibName: "SundayCell", bundle: nil), forCellReuseIdentifier: "SundayCell")
        
//        let sundayCell = UINib(nibName: "SundayCell", bundle: nil)
//        sundayTV.register(sundayCell, forCellWithReuseIdentifier: "SundayCell")
        
        sundayTV.delegate = self
        sundayTV.dataSource = self

    }
    
}

extension SundayVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = sundayTV.dequeueReusableCell(withIdentifier: "SundayCell", for: indexPath) as! SundayCell
        
        cell.sundayName.text = "hi"
        
        return cell
    }
    
    
}
