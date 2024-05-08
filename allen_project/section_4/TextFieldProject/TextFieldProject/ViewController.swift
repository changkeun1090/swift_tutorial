import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

      
    @IBOutlet weak var textField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // textField의 위임자로 ViewController를 지정
        textField.delegate = self
        setup()
    }
    
    private func setup() {
        view.backgroundColor = UIColor.gray
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
    // textfield 입력 시작될 때 호출되어 textfield 편집 허락여부 결정
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    } 
    
    // textfield 입력을 시작될 때 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        return
    }
    
    // 입력할 때 마다 호출되어 입력을 계속 허락할지 말지 결정
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let count = textField.text?.count, count > 10 {
            return false
        } else  {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "EMPTY!!!!"
            return false
        } else {
            return true
        }
    }

}

