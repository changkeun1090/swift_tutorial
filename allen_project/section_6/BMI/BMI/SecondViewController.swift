import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmi: Double?
    var adviceString: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        
        guard let bmi = bmi else {return}
        bmiNumberLabel.text = String(bmi)
        
        adviceLabel.text = getAdvice()
        bmiNumberLabel.backgroundColor = getBackgroundColor()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else {return UIColor.black}
        
        switch bmi {
        case ..<18.6:
            return .lightGray
        case 18.6..<23.0:
            return .blue
        case 23.0..<25.0:
            return .orange
        case 25.0...:
            return .cyan
        default:
            return .black
        }
    }
    
    func getAdvice() -> String {
        guard let bmi = bmi else {return ""}
        
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0...:
            return "고도비만"
        default:
            return ""
        }
    }
    
}
