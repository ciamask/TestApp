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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
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
    }
    
    private func configureView(with balance: Int) {
        balanceAmount.text = String(balance)
    }
    
    
    
}

