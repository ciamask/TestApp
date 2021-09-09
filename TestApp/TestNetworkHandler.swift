//
//  TestNetworkHandler.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/8/21.
//

import Foundation

class TestNetworkHandler : NetworkHandler {
    
    func getBalance(onCompletion: @escaping (BalanceModel) -> ()) {
            onCompletion(BalanceModel(balance: 2000))
            return
    }

}
