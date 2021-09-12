//
//  ViewController.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var networkHandler: NetworkHandler!
    
    @IBOutlet weak var balanceAmount: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!
    var transactionData = [Transaction]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
        setupTableView()
    }
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Accounts", bundle:nil)
        let transactionViewController = storyBoard.instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        self.navigationController?.pushViewController(transactionViewController, animated: true)
    }
    
    private func callApi() {
        networkHandler.getBalance { [weak self] (model) in
            guard let self = self else {return}
            let balance = model.balance ?? 0
            self.configureView(with: balance)
        }
        networkHandler.getTransactionData { [weak self] (model) in
            guard let self = self else {return}
            guard let data = model.transactions else {return}
            self.transactionData = data
            DispatchQueue.main.async { [weak self] in
                self?.transactionTableView.reloadData()
            }
        }
    }
    
    private func configureView(with balance: Int) {
        balanceAmount.text = String(balance)
    }
    
    @IBOutlet weak var transactiontableViewCell: UITableViewCell!
    private func setupTableView() {
        let nib = UINib(nibName: "TransactionTableViewCell", bundle: nil)
        transactionTableView.register(nib, forCellReuseIdentifier: "transactionTableViewCell")
        transactionTableView.delegate = self
        transactionTableView.dataSource = self
    }
}

//MARK:- TableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionTableViewCell", for: indexPath) as! TransactionTableViewCell
        let model = transactionData[indexPath.row]
        cell.configureCell(with: model)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

