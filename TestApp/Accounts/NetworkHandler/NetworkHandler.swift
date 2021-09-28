//
//  NetworkProtocol.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/8/21.
//

import Foundation
import RxCocoa
import RxSwift

protocol NetworkHandler {
    func getBalance() -> Driver<BalanceModel>
//    func getBalance(onCompletion: @escaping (BalanceModel) -> ())
    func getTransactionData(onCompletion: @escaping (TransactionsModel) -> ())
    func postCreditBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ())
    func postDebitBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ())
}
