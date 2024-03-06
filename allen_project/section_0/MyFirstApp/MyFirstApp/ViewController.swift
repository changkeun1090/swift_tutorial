//
//  ViewController.swift
//  MyFirstApp
//
//  Created by ChangKeun Ji on 2024/03/05.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var mainLabel: UILabel!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    
       
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        mainLabel.text = "안녕하세요"
        mainLabel.backgroundColor = UIColor.yellow
        
    }
    
    
}

