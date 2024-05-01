import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        // 앱 실행 시 처음 실행되는 함수
        super.viewDidLoad()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
        // mainLabel.backgroundColor = UIColor.brown
        // mainLabel.backgroundColor = #colorLiteral()
        // #imageLiteral()
            
        myButton.backgroundColor = UIColor.gray
        myButton.setTitleColor(.black, for: .normal)
    }
    
    
}

