import UIKit
import AudioToolbox

class ViewController: UIViewController {
   
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    var number: Int = 0
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    private func configureUI() {
        mainLabel.text = "초를 선택하세요"
        setSliderCenter()
    }
    private func setSliderCenter() {
        slider.setValue(0.5, animated: true)
    }
    
     
    @IBAction func sliderChanged(_ sender: UISlider) {
        number = Int(sender.value*60)
        mainLabel.text = "\(number) 초"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            
                guard let self = self else { return }
                
                // Decrease the counter value
                self.number -= 1
                
                // Update the counter label
                self.mainLabel.text = "\(self.number) 초"
                 
                self.slider.value = Float(number) / Float(60)
                
                // Check if counter has reached 0, if so, stop the timer
                if self.number == 0 {
                    timer.invalidate()
                    mainLabel.text = "종료 😀"
                    AudioServicesPlaySystemSound(1016)
                }
            }
         
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        number = 0
        configureUI()
        AudioServicesPlaySystemSound(1000)
    }
    
}

