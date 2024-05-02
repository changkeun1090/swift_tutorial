//
//  ViewController.swift
//  RPSGame
//
//  Created by ChangKeun Ji on 2024/05/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    
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
            
    }
        
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 컴퓨터의 랜덤 선택을 이미지와 label에 표시한다.
        
        // 내가 선택한 것을 이미지와 label에 표시한다.
        
        // 선택된 정보와 컴퓨터의 선택과 비교 후 결과 표시
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 컴퓨터의 이미지와 label을 준비이미지와 텍스트로 만든다.
        
        // 나의 선택과 label을 준비이미지와 텍스트로 만든다.
        
        // 메인 label을 "선택하세요"로 표시
        
        // 컴퓨터가 다시 랜덤 선택하고 값을 저장
        
    }
                
}

