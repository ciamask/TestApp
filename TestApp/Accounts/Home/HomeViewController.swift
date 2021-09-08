//
//  ViewController.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Accounts", bundle:nil)
//    let networkProtocol: NetworkProtocol!
    @IBOutlet weak var balanceAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.networkHandler.getBalance { [weak self] (model) in
//            guard let self = self else {return}
//            self.configureView(with: model)
//        }
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        let transactionViewController = storyBoard.instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        self.navigationController?.pushViewController(transactionViewController, animated: true)
    }
    
    private func configureView(with balance: Int) {
        balanceAmount.text = String(balance)
    }
}

