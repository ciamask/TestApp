//
//  HomeVC.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class HomeVC: BaseViewController {
    
    let currentView = HomeView()
    let data = transactionData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavButtons()
    }
    
    override func loadView() {
        view = currentView
    }
    
    private func setupTableView() {
        currentView.tableView.register(HomeCell.self, forCellReuseIdentifier: HomeCell.cellId)
        currentView.tableView.delegate = self
        currentView.tableView.dataSource = self
    }
    
    private func setupNavButtons() {
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func handleAdd() {
        let transactionVC = TransactionVC()
        navigationController?.pushViewController(transactionVC, animated: true)
    }
    
}

//MARK:- Table Delegate Block

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.cellId, for: indexPath) as! HomeCell
        let model = data.getData()[indexPath.item]
        cell.configureCell(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
}

