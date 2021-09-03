//
//  TransactionVC.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//

import UIKit

class TransactionVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let currentView = TransactionView()
    
    override func loadView() {
        view = currentView
    }
 
}
