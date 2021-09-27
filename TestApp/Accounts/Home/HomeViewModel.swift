//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/26/21.
//

import Foundation

class HomeViewModel {
    
    var networkHandler: NetworkHandler!
    var onGetBalanceCalled : ((Int) -> Void)?
    
    func callgetBalanceApi() {
        networkHandler.getBalance { [weak self] model in
            guard let self = self else {return}
            let balance = model.balance ?? 0
            print(balance)
            self.onGetBalanceCalled?(balance)
        }
    }
    
}
