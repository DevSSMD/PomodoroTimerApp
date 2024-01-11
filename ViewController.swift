
import UIKit

class ViewController: UIViewController {
    var pageViewController: UIPageViewController!
    var timer = Timer()
    var isTimerRunning = false
    var totaltTimeInSeconds = 1500
    var label = UILabel()
    @IBOutlet var timerImageView: UIImageView!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var ImgBStackView: UIStackView!
    @IBOutlet var breakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureImageView()
        
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "25:00"
        label.textColor = UIColor.black
        timerImageView.addSubview(label)
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: timerImageView.centerXAnchor), label.centerYAnchor.constraint(equalTo: timerImageView.centerYAnchor, constant: 3)])
    }

    func configureImageView() {
        timerImageView.image = UIImage(named: "coral circle Background Removed")
        timerImageView.layer.cornerRadius = timerImageView.frame.width / 2
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            label.text = "25:00"
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
        }
    }
    
    @objc func updateTimer() {
        if totaltTimeInSeconds > 0 {
            totaltTimeInSeconds -= 1
            updateTimerLabel()
        } else {
            label.text = "Break time!"
            timer.invalidate()
        }
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        totaltTimeInSeconds = 1500
        if isTimerRunning == true {
            timer.invalidate()
            label.text = "25:00"
            isTimerRunning = false
        }
    }
    
    @IBAction func breakButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        if let secondVC = storyboard?.instantiateViewController(identifier: "SecondVC") as? SecondViewController {
            navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func updateTimerLabel(){
        let minutes = totaltTimeInSeconds / 60
        let seconds = totaltTimeInSeconds % 60
        label.text = String(format: "%02d:%02d", minutes, seconds)
    }
}
