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
//    let Authorization = 8918623815
}

extension URLRequest {
    // giving resource here, URL. Return an observable of type T
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        
        return Observable.from([resource.url]) // added into an array the returned parameter i.e URL
            .flatMap { url -> Observable<Data> in  // did flatmap to map the all data from the url
                var request = URLRequest(url: url)
                request.setValue("8918623815", forHTTPHeaderField: "Authorization")
                return URLSession.shared.rx.data(request: request) // ->
            }.map { data -> T? in           // return from flat map is then mapped into the module created here Article.
                return try? JSONDecoder().decode(T.self, from: data)
        }.asObservable()
        
    }
    
}
