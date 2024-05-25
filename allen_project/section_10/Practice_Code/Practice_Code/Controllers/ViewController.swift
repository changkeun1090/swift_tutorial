import UIKit

class ViewController: UIViewController {
    
    
    var tableView = UITableView()
    var dataManager = MovieDataManager()
    var movieArray:[Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTableView()
        setupTableViewConstraints()
        setupDatas()
//        setupNaviBar()

    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func setupDatas() {
        dataManager.setMovieArray()
        movieArray = dataManager.getMovieArray()
    }

}

// 1. Viewcontroller 내부에 TabelView를 생성 후 autolayout을 완성하고 addView 한다.
// 2. Movie와 DataManager 파일을 생성한다.
// 3. MovieCell 클래스 생성 후 Viewcontroller 내부에서 data와 movieCell을 연결한다. 
// 4. Detail VC 생성 후 연결하기

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

extension ViewController: UITableViewDelegate {
    
}
