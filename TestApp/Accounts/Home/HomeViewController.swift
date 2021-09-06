//
//  ViewController.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  

    @IBAction func addButtonClicked(_ sender: Any) {
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let transactionViewController = storyBoard.instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        self.navigationController?.pushViewController(transactionViewController, animated: true)
    }
    
}

