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
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startButton.layer.cornerRadius = 12
        
        // 레이블 입력 시 버튼 색변환
        self.startButton.isEnabled = false
//        self.countLabel.addTarget(self, action: #selector(self.textDidChange(_:)), for: .valueChanged)
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
            
        if isTimerRunning == false {
            runTimer()
            self.startStopLabel.text = "Stop"
        } else {
            isTimerRunning = false
            self.myTimer.invalidate()
            self.startStopLabel.text = "Start"
        }

    }
    
    func runTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        isTimerRunning = true
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
        } else if count < 1 {
            self.startStopLabel.text = "Start"
            self.myTimer.invalidate()
        }
    }
    @objc func textDidChange(_ sender: Any?) {
        self.startButton.isEnabled = true
        self.startButton.backgroundColor = UIColor.black
    }
}

