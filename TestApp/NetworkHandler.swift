//
//  NetworkHandler.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/8/21.
//

import Foundation

class NetworkHandler : NetworkProtocol {
    
    func getBalance(onCompletion: @escaping (BalanceModel) -> ()) {
        let url = URLComponents(string: (ApiConstants.baseUrl + ApiConstants.getBalance))!
        print(url)
        
        var request = URLRequest(url: url.url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        request.setValue("8918623815", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            do {
                let decodedValue = try JSONDecoder().decode(BalanceModel.self, from: data)
                onCompletion(decodedValue)
            } catch let err {
                print(err.localizedDescription)
            }
        }.resume()
    }
    
}
