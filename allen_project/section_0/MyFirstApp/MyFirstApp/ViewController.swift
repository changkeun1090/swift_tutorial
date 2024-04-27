//
//  ViewController.swift
//  MyFirstApp
//
//  Created by ChangKeun Ji on 2024/04/12.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        // #colorLiteral(), #imageLiteral()
        
            
    }
    
    
}

