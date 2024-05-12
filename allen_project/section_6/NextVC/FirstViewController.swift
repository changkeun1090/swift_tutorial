import UIKit

class FirstViewController: UIViewController {

    let mainLabel = UILabel()
    //    let backButton = UIButton(type: .custom)
    let backButton: UIButton = {
        let button = UIButton()
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action:#selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var someString: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureUI()
    }
    
    func setup() {
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        view.addSubview(mainLabel)
        view.addSubview(backButton)
        view.backgroundColor = .gray
    }
    
    func configureUI() {
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
                
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}

