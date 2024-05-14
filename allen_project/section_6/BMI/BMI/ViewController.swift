import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calcurateButton: UIButton!
    var bmi: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightTextField.delegate = self
        weightTextField.delegate = self
        makeUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
 
    func makeUI() {
        mainLabel.text = "키와 몸무게를 입력해주세요"
        calcurateButton.layer.cornerRadius = 5
        calcurateButton.clipsToBounds = true
        heightTextField.placeholder = "cm 단위로 입력"
        weightTextField.placeholder = "kg 단위로 입력"
    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true) // Dismiss the keyboard
       }
    
    @IBAction func calcurateButtonTapped(_ sender: UIButton) {
        if let h = heightTextField.text, let w = weightTextField.text {
            bmi = calcurateBMI(height: h, weight: w)
        }
    }
    
    // 다음화면으로 넘어갈 지 허락맡기
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == "toSecondVC" else {return false}
        
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 모두 입력하셔야 합니다!!"
            mainLabel.textColor = .red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = .black
        return true
    }
    
    // 세그웨이를 포착해서 데이터 전달하기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            if let secondVC = segue.destination as? SecondViewController {
                secondVC.bmi = self.bmi
            }
        }
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    func calcurateBMI(height: String, weight: String) -> Double {
        guard let h = Double(height), let w = Double(weight) else {return 0.0}
        var bmi = w / (h*h) * 10000
        bmi = round(bmi*10) / 10
        return bmi
        
    }
    
}


















extension ViewController: UITextFieldDelegate {

    // 숫자만 입력받기
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // '키'만 적용하고 싶다면
        // -> if textField == heightTextField {}
        
        if Int(string) != nil || string == "" {
            return true
        }
        
        return false
    }
    
    // 'return' 눌렀을 때 focus 옮기기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // height에서 return 눌렀을 때
         if textField == heightTextField {
             weightTextField.becomeFirstResponder() // Move focus to textField2
         } else {
             // weight에서 return 눌렀을 때
             if heightTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                 weightTextField.resignFirstResponder() // Hide the keyboard
             }
         }
         return true
     }
    
}
