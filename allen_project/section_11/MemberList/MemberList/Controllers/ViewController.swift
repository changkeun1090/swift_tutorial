import UIKit

final class ViewController: UIViewController {

    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // ???
        view.backgroundColor = .white
        
        setupTableView()
        setupTableViewConstraints()
        setupNaviBar()
        setupDatas()
        
        // Cell의 타입과 이름을 등록한다.
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = 60
    }
    
    func setupDatas() {
        memberListManager.makeMembersListDatas()
    }
    
    func setupNaviBar() {
        title = "회원목록"
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .systemBlue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
//        self.navigationItem.rightBarButtonItem =
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)            
        ])
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memberListManager.getMembersList().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell

        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    
        let detailVC = DetailViewController()
        detailVC.member = memberListManager[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    // 1. DVC가 호출되고 "private var detailView = DetailView()" 작동하여 datailView가 메모리에 생성된다.
    // 2. VC레벨에서 detailVC의 member가 업데이트 된다.
    // 3. navigation의 push로 detailVC의 loadView가 호출된다.
    // 4. 이미 생성된 detailView의 member가 업데이트 되며 didset 때문에 detailView의 화면이 수정된다. 
    // 5. 최종하면이 올라가고 DetailViewController의 viewDidLoad가 호출된다.
}
