import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray:[UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        firstImageView.image = diceArray.randomElement()
        secondImageView.image = diceArray.randomElement()
                
        // 첫번째 이미지 랜덤 변경
        if let random = diceArray.randomElement() {
            firstImageView.image = random
        } else {}
        
        
        // 두번째 이미지 랜덤 변경
        if let random = diceArray.randomElement() {
            secondImageView.image = random
        } else {}
        
    }
    
    
    
    
    
    

}

