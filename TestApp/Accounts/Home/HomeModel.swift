//
//  HomeModel.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/2/21.
//


struct transactionModel {
    let label: String
    let amount: String
}

struct transactionData {
    private var data = [transactionModel]()
    
    init() {
        data.append(transactionModel(label: "Credit", amount: "10.09"))
        data.append(transactionModel(label: "Debit", amount: "26.80"))
        data.append(transactionModel(label: "Credit", amount: "32.33"))
        data.append(transactionModel(label: "Debit", amount: "44.01"))
        data.append(transactionModel(label: "Credit", amount: "50.00"))
        data.append(transactionModel(label: "Debit", amount: "10.00"))
        data.append(transactionModel(label: "Credit", amount: "10.09"))
        data.append(transactionModel(label: "Debit", amount: "77.03"))
        data.append(transactionModel(label: "Credit", amount: "10.09"))
        data.append(transactionModel(label: "Debit", amount: "50.00"))
    }
    
    func getData() -> [transactionModel]{
        return data
    }
    
}
