//
//  ProdNetworkHandler.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/26/21.
//

import Foundation
import RxSwift
import RxCocoa

class ProdNetworkHandler : NetworkHandler {
    
    let disposeBag = DisposeBag()
    
    func getBalance(onCompletion: @escaping (BalanceModel) -> ()) {
        let resource = Resource<BalanceModel>(url: URL(string:ApiConstants.baseUrl + ApiConstants.getBalance)!)
        URLRequest.load(resource: resource)
            .subscribe(onNext: { balanceResponse in
                onCompletion(balanceResponse ?? BalanceModel.empty)
            }).disposed(by: disposeBag)
    }
    
    func postCreditBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ()) {
        onCompletion("Success")
    }
    
    func postDebitBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ()) {
        onCompletion("Success")
    }
    
    func getTransactionData(onCompletion: @escaping (TransactionsModel) -> ()) {
        onCompletion(TransactionsModel(transactions: [Transaction.init(amount: 100, transactionAmount: 10, type: "Credit", title: "HI", time: "2021-01-01", id: "1jbwdiyg123")]))
    }
    
    
}
