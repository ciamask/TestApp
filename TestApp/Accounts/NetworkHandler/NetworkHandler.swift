//
//  NetworkProtocol.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/8/21.
//

import Foundation

protocol NetworkHandler {
    func getBalance(onCompletion: @escaping (BalanceModel) -> ())
    func getTransactionData(onCompletion: @escaping (TransactionsModel) -> ())
    func postCreditBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ())
    func postDebitBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ())
}
