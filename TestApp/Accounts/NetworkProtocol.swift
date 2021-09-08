//
//  NetworkProtocol.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/8/21.
//

import Foundation

protocol NetworkProtocol{
    func getBalance(onCompletion: @escaping (BalanceModel) -> ())
}
