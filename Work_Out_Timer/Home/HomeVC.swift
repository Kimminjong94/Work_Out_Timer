import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var startStopLabel: UILabel!
    
    @IBOutlet weak var resetButton: UIButton!
    
    var myTimer = Timer()
    var count = 0
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startButton.layer.cornerRadius = 12
        self.startStopLabel.layer.zPosition = 999
        self.startButton.layer.zPosition = 0
        self.startButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - 타이머 시작 버튼
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        DispatchQueue.main.async() {
            if self.isTimerRunning == false {
                self.runTimer()
                self.startStopLabel.text = "Pause"
            } else {
                self.isTimerRunning = false
                self.myTimer.invalidate()
                self.startStopLabel.text = "Start"
            }
        }
        

    }
    //MARK: - 타이머 관련 메소드
    // 타이머 메소드
    func runTimer() {
        
        DispatchQueue.main.async() {
            self.myTimer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(self.updateCounter),
                userInfo: nil,
                repeats: true)
            self.isTimerRunning = true
        }

    }
    // 타이머 메소드 셀렉터
    @objc func updateCounter() {
        if count > 0 {
            count -= 1
            print("\(count)")
            self.countLabel.text = "\(self.count)"


        } else if count < 1 {
            self.startStopLabel.text = "Start"
            self.myTimer.invalidate()
            self.startButton.isEnabled = false
            self.startButton.backgroundColor = UIColor.systemGray2
        }
    }
    // 초버튼 클릭 시 버튼 활성화
    func buttonEnable() {
        if count > 0 {
            self.startButton.isEnabled = true
            self.startButton.backgroundColor = UIColor.black
        }
    }
    //MARK: - 30, 60, 120초 타이머 버튼
    @IBAction func count30Tapped(_ sender: UIButton) {
        self.count += 30
        self.countLabel.text = "\(self.count)"
        buttonEnable()
    }
    @IBAction func count60Tapped(_ sender: UIButton) {
        self.count += 60
        self.countLabel.text = "\(self.count)"
        buttonEnable()
    }
    @IBAction func count120Tapped(_ sender: UIButton) {
        self.count += 120
        self.countLabel.text = "\(self.count)"
        buttonEnable()
    }
    //MARK: - 리셋 버튼
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        self.myTimer.invalidate()
        isTimerRunning = false
        count = 0
        self.startStopLabel.text = "Start"
        self.countLabel.text = "\(self.count)"
        self.startButton.isEnabled = false
        self.startButton.backgroundColor = UIColor.systemGray2
    }
}
