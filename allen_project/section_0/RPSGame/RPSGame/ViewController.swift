import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // '준비' 이미지를 띄운다.
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        // Label에 "준비" 문자열을 띄운다.
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 선택된 정보를 저장한다.
        let title  = sender.currentTitle!
     
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
        
        switch myChoice {
        case .rock:
            myImageView.image = UIImage(named: "rock.png")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = UIImage(named: "paper.png")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = UIImage(named: "scissors.png")
            myChoiceLabel.text = "가위"
        }
    }
        
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 컴퓨터의 랜덤 선택을 이미지 와 label에 표시한다.
        
        switch comChoice {
        case .rock:
            comImageView.image = UIImage(named: "rock.png")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = UIImage(named: "paper.png")
            comChoiceLabel.text = "보"
        case .scissors:
            comImageView.image = UIImage(named: "scissors.png")
            comChoiceLabel.text = "가위"
        }
        
        // 선택된 정보와 컴퓨터의 선택과 비교 후 결과 표시
        if comChoice == myChoice {
            mainLabel.text = "비겼습니다!"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼습니다!"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼습니다!"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼습니다!"
        } else {
            mainLabel.text = "패배했습니다!"
        }
        
        // 컴퓨터의 선택을 다시 랜덤으로 설정한다.
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 컴퓨터의 이미지와 label을 준비이미지와 텍스트로 만든다.
        // 나의 선택과 label을 준비이미지와 텍스트로 만든다.
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
        // 메인 label을 "선택하세요"로 표시
        mainLabel.text = "선택하세요"
        
    }
                
}

