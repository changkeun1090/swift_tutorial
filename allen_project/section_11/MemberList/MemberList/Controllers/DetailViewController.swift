import UIKit

final class DetailViewController: UIViewController {

    private var detailView = DetailView()
    
    var member: Member?
    
    // viewDidLoad 보다 먼저 호출
    override func loadView() {        
        view = detailView        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAction()
        setupData()
    }
    
    func setupData() {
        detailView.member = member
    }

    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for:.touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        print("버튼이 눌림")
    }
}


