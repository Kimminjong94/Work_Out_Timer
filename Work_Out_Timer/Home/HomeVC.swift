//
//  ViewController.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/01/22.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startStopLabel: UILabel!
    
    
    var myTimer = Timer()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        
        if count == 0 {
            self.startStopLabel.text = "Start"
        } else {
            self.myTimer.invalidate()
            self.startStopLabel.text = "Stop"
        }
        DispatchQueue.main.async() {
            self.myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func count30Tapped(_ sender: UIButton) {
        self.count += 30
        self.countLabel.text = "\(self.count)"

    }
    @IBAction func count60Tapped(_ sender: UIButton) {
        self.count += 60
        self.countLabel.text = "\(self.count)"

    }
    @IBAction func count120Tapped(_ sender: UIButton) {
        self.count += 120
        self.countLabel.text = "\(self.count)"

    }
    
    @objc func updateCounter() {
        if count > 0 {
            print("\(count) seconds to the end of the world")
            count -= 1
            self.countLabel.text = "\(self.count)"
        }

    }
}

