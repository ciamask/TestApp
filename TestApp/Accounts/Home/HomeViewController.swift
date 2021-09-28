//
//  ViewController.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var balanceAmount: UILabel!
    @IBOutlet weak var transactionTableView: UITableView!
    var transactionData = [Transaction]()
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureView()
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Accounts", bundle:nil)
        let transactionViewController = storyBoard.instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        self.navigationController?.pushViewController(transactionViewController, animated: true)
    }
    
//    private func callApi() {
//        networkHandler.getBalance { [weak self] (model) in
//            guard let self = self else {return}
//            let balance = model.balance ?? 0
//            self.configureView(with: balance)
//        }
//        networkHandler.getTransactionData { [weak self] (model) in
//            guard let self = self else {return}
//            guard let data = model.transactions else {return}
//            self.transactionData = data
//            DispatchQueue.main.async { [weak self] in
//                self?.transactionTableView.reloadData()
//            }
//        }
//    }
    
    private func configureView() {
        let balance = homeViewModel.callgetBalanceApi()
            .observe(on: MainScheduler.instance)
            .retry(3)
            .catch { error in
                print(error.localizedDescription)
                return Observable.just(BalanceModel.empty)
            }.asDriver(onErrorJustReturn: BalanceModel.empty)
        
        balance.map { "$ \($0.balance ?? 0)" }
            .drive(self.balanceAmount.rx.text)
            .disposed(by: disposeBag)
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

