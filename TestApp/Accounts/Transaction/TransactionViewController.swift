//
//  TransactionViewController.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/6/21.
//

import UIKit

class TransactionViewController: UIViewController {
    
    var networkHandler: NetworkHandler!
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var remarksTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onCreditButtonClicked(_ sender: Any) {
        let amount = Int(amountTextField.text ?? "") ?? 0
        let remark = remarksTextField.text ?? ""
        networkHandler.postCreditBalance(amount: amount, remarks: remark) { [weak self] (model) in
            guard let self = self else {return}
            print(model)
            DispatchQueue.main.async { [weak self] in
                self?.showAlert()
            }
        }
    }
    
    @IBAction func onDebitButtonClicked(_ sender: Any) {
        let amount = Int(amountTextField.text ?? "") ?? 0
        let remark = remarksTextField.text ?? ""
        networkHandler.postDebitBalance(amount: amount, remarks: remark) { [weak self] (model) in
            guard let self = self else {return}
            print(model)
            DispatchQueue.main.async { [weak self] in
                self?.showAlert()
            }
        }
    }
    
    private func showAlert(){
        let alert = UIAlertController(title: "Test App", message: "Success", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
