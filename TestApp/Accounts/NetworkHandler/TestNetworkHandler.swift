//
//  TestNetworkHandler.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/8/21.
//

import Foundation

class TestNetworkHandler : NetworkHandler {
    func postCreditBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ()) {
        onCompletion("Success")
    }
    
    func postDebitBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ()) {
        onCompletion("Success")
    }
    
    
    func getBalance(onCompletion: @escaping (BalanceModel) -> ()) {
            onCompletion(BalanceModel(balance: 2000))
            return
    }
    
    func getTransactionData(onCompletion: @escaping (TransactionsModel) -> ()) {
        onCompletion(TransactionsModel(transactions: [Transaction.init(amount: 100, transactionAmount: 10, type: "Credit", title: "HI", time: "2021-01-01", id: "1jbwdiyg123")]))
    }
    
}
