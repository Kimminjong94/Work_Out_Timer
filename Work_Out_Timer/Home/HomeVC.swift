//
//  ViewController.swift
//  Work_Out_Timer
//
//  Created by 김민종 on 2022/01/22.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startStopLabel: UILabel!
    
    
    var myTimer = Timer()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startButton.layer.cornerRadius = 12
        
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
            
        
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: true)
        
        if count == 0 {
            self.startStopLabel.text = "Start"
        } else {
            self.startStopLabel.text = "Stop"
        }

    }
    
    @IBAction func count30Tapped(_ sender: UIButton) {
        self.count += 5
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
        self.countLabel.text = "\(self.count)"
        if count > 0 {
            count -= 1
            print("\(count)")
        }


    }
}

