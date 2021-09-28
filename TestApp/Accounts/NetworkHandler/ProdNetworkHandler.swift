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
    
    func getBalance() -> Driver<BalanceModel> {
        let resource = Resource<BalanceModel>(url: URL(string:ApiConstants.baseUrl + ApiConstants.getBalance)!)
        let model = URLRequest.load(resource: resource)
            .observe(on: MainScheduler.instance)
            .retry(3) // retrying on error
            .catch { error in  // handeling error
                print(error.localizedDescription)
                return Observable.just(BalanceModel.empty)
            }.asDriver(onErrorJustReturn: BalanceModel.empty)

        return model
        
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
