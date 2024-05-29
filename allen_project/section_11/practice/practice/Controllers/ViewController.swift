//
//  ViewController.swift
//  Practice
//
//  Created by ChangKeun Ji on 5/29/24.
//

import UIKit

class ViewController: UIViewController {

    var tableView = UITableView()
    var memberDataManager = MemberListManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        setupTableView()
    }
    
    func setupData() {
        memberDataManager.initializeMembersListDatas()
    }

    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 90
        
        let constraints = [
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ]
        NSLayoutConstraint.activate(constraints)
        
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        
    }
}

extension ViewController: UITableViewDataSource {
    // Cell의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberDataManager.getMemberList().count
    }
    
    // Cell에 data 전달
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.member = memberDataManager[indexPath.row]
    }
}

extension ViewController: UITableViewDelegate {
    
    // 클릭했을 때 행동 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}
