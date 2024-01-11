

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var circleImageView: UIImageView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    var timer = Timer()
    var labelTimer: UILabel!
    var isTimerRunning = false
    var totalTimeInSeconds = 300
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // countdown label creation
        labelTimer = UILabel()
        labelTimer.text = "5:00"
        labelTimer.textColor = UIColor.white
        labelTimer.font = .systemFont(ofSize: 30)
        labelTimer.numberOfLines = 0
        labelTimer.translatesAutoresizingMaskIntoConstraints = false
        circleImageView.addSubview(labelTimer)
        NSLayoutConstraint.activate([labelTimer.centerXAnchor.constraint(equalTo: circleImageView.centerXAnchor), labelTimer.centerYAnchor.constraint(equalTo: circleImageView.centerYAnchor)])
     
        
        

    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if !isTimerRunning {
            timer.invalidate()
            labelTimer.text = "5:00"
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
    }
    
    @objc func updateTimer(){
        if totalTimeInSeconds > 0 {
            totalTimeInSeconds -= 1
            updateTimerLabel()
        } else {
            timer.invalidate()
            labelTimer.font = .systemFont(ofSize: 15)
            labelTimer.text = "Back to work!"
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        totalTimeInSeconds = 300
        labelTimer.font = .systemFont(ofSize: 30)
        labelTimer.text = "5:00"
        if isTimerRunning {
            timer.invalidate()
            isTimerRunning = false
        }
    }
    
    func updateTimerLabel() {
        let minutes = totalTimeInSeconds / 60
        let seconds = totalTimeInSeconds % 60
        labelTimer.text = String(format: "%02d:%02d", minutes, seconds)
        
    }
}
