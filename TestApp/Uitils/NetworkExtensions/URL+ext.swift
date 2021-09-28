//
//  URL+ext.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/26/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    
//     giving resource here, URL. Return an observable of type T
//    static func load<T>(resource: Resource<T>) -> Observable<T?> {
//
//        return Observable.from([resource.url]) // added into an array the returned parameter i.e URL
//            .flatMap { url -> Observable<Data> in  // did flatmap to map the all data from the url
//                var request = URLRequest(url: url)
//                request.setValue("8918623815", forHTTPHeaderField: "Authorization")
//                return URLSession.shared.rx.data(request: request) // ->
//            }.map { data -> T? in           // return from flat map is then mapped into the module created here Article.
//                return try? JSONDecoder().decode(T.self, from: data)
//        }.asObservable()
//
//    }
    
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {

        return Observable.just(resource.url)
            //gives out response of type HTTPURLResponse
            .flatMap { url -> Observable<(response: HTTPURLResponse, data: Data)> in
                var request = URLRequest(url: url)
                request.setValue("8918623815", forHTTPHeaderField: "Authorization")
                return URLSession.shared.rx.response(request: request) //gives response also
            }.map { response, data -> T in
                // checking response with status code.
                if 200..<300 ~= response.statusCode {
                    return try JSONDecoder().decode(T.self, from: data)
                } else {
                    throw RxCocoaURLError.httpRequestFailed(response: response, data: data) // throwing error
                }
        }.asObservable()
    }
    
}
