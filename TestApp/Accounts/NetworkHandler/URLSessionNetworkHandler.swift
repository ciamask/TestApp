////
////  NetworkHandler.swift
////  TestApp
////
////  Created by Shreeya Maskey on 9/8/21.
////
//
//import Foundation
//
//class ProdURLSESSIONNetworkHandler : NetworkHandler {
//
//    func getBalance(onCompletion: @escaping (BalanceModel) -> ()) {
//        let url = URLComponents(string: (ApiConstants.baseUrl + ApiConstants.getBalance))!
//        var request = URLRequest(url: url.url!)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "GET"
//        request.setValue("8918623815", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            guard let self = self else { return }
//            guard let data = data else {
//                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
//                return
//            }
//            do {
//                let decodedValue = try JSONDecoder().decode(BalanceModel.self, from: data)
//                DispatchQueue.main.async { [weak self] in
//                    guard let self = self else { return }
//                    onCompletion(decodedValue)
//                }
//            } catch let err {
//                print(err.localizedDescription)
//                return
//            }
//        }.resume()
//    }
//
//
//
//    func getTransactionData(onCompletion: @escaping (TransactionsModel) -> ()) {
//        let url = URLComponents(string: (ApiConstants.baseUrl + ApiConstants.getTransactions))!
//        var request = URLRequest(url: url.url!)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "GET"
//        request.setValue("8918623815", forHTTPHeaderField: "Authorization")
//
//        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            guard let self = self else { return }
//            guard let data = data else {
//                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
//                return
//            }
//            do {
//                let decodedValue = try JSONDecoder().decode(TransactionsModel.self, from: data)
//                DispatchQueue.main.async {
//                    onCompletion(decodedValue)
//                }
//            } catch let err {
//                print(err.localizedDescription)
//                //                onCompletion()
//                return
//            }
//        }.resume()
//    }
//
//    func postCreditBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ()) {
//        let url = URLComponents(string: (ApiConstants.baseUrl + ApiConstants.postCredit))!
//        let params: [String: Any] = [
//            "amount": amount,
//            "title": remarks
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: params)
//        var request = URLRequest(url: url.url!)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.setValue("8918623815", forHTTPHeaderField: "Authorization")
//        request.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print(error?.localizedDescription ?? "No data")
//                return
//            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let responseJSON = responseJSON as? [String: Any] {
//                DispatchQueue.main.async {
//                    onCompletion("Success")
//                }
//            }
//        }.resume()
//    }
//
//    func postDebitBalance(amount: Int, remarks: String, onCompletion: @escaping (String) -> ()) {
//        let url = URLComponents(string: (ApiConstants.baseUrl + ApiConstants.postDebit))!
//        let params: [String: Any] = [
//            "amount": amount,
//            "title": remarks
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: params)
//        var request = URLRequest(url: url.url!)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.setValue("8918623815", forHTTPHeaderField: "Authorization")
//        request.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data, error == nil else {
//                print(error?.localizedDescription ?? "No data")
//                return
//            }
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let result = responseJSON as? [String: Any] {
//                DispatchQueue.main.async {
//                    onCompletion("Success")
//                }
//            }
//        }.resume()
//    }
//}
