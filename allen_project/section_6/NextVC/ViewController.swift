import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
         
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {

        let firstVC = FirstViewController()
        firstVC.someString = "I had some help"
        
//         firstVC.mainLabel.text = "I had some help"
        // :: 코드에서는 가능하지만 스토리보드에서는 이런 방식을 사용할 수 없다.
        
//        firstVC.modalPresentationStyle = .fullScreen
            
        present(firstVC, animated: true, completion: nil)
                        
    }
    
    // 2) 스토리보드로 생성 후 코드로 연결 / ⭐️ 추천
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {

        // ⭐️ 스토리보드 인스펙터에 ID "secondVC"를 입력해줘야 한다.
        //: instantiateViewController는 UIViewController 타입을 반환하므로 SecondViewController으로 타입캐스팅 해준다.
        guard let secondVC = storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else {return}
        
        secondVC.someString = "Fortnight"
//        secondVC.mainLabel.text = "Fortnight"
            //: view가 완전히 생성되기 전 속성에 접근할 수 없다.
        
        present(secondVC, animated: true, completion: nil)
    }
    
    // 3) 스토리보드로 생성 후 스토리보드로 연결 (간접 세그웨이 - 화면끼리 이어준다)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
     
        // 버튼 클릭 -> 세그웨이 활성화 -> prepare 함수 자동호출
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 데이터 전달이 일어나는 곳
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController
            thirdVC.someString = "Not like us"
        }
        
        // 4) 스토리보드로 생성 후 스토리보드로 연결 (직접 세그웨이 - 버튼과 화면을 이어준다)
        if segue.identifier == "toFourthVC" {
            let fouthVC = segue.destination as! FourthViewController
            fouthVC.someString = "Saturn"
        }
    }
    
    //: 연결해줄지 말지 결정 가능. 4)의 경우에만 사용이 가능
    //: 3)의 경우에는 "storyboardWithSegueButtonTapped" 내에서 조건문 생성 가능
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if true {
            return true
        }
    }

}
