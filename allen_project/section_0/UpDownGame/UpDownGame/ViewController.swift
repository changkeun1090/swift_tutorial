import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    var comChoice:Int = 0
    var userChoice:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 두 레이블의 Text를 설정
        mainLabel.text = "선택하세요"
        numberLabel.text = "0"
        
        // comChoice를 1...10 중에서 랜덤으로 저장
        comChoice = Int.random(in: 1...10)
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        // 선택된 숫자를 userChoice에 할당
        userChoice = sender.tag 
        
        // 선택된 숫자를 numberLabel의 표시
        numberLabel.text = String(userChoice)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
                
        // comChoice와 userChoice를 비교 후 mainLabel의 text 변경
        
        if(comChoice > userChoice) {
            mainLabel.text = "UP"
        } else if(comChoice < userChoice) {
            mainLabel.text = "DOWN"
        } else {
            mainLabel.text = "BINGO!!!"
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 두 레이블의 text를 초기화
        mainLabel.text = "선택하세요"
        numberLabel.text = "0"
        
        // comChoice를 다시 랜덤으로 설정
        comChoice = Int.random(in: 1...10)
    }
    
    
}

