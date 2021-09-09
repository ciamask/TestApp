//
//  SwinjectStoryboard.swift
//  TestApp
//
//  Created by Shreeya Maskey on 9/9/21.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    
    class func setup() {
        let swinject = defaultContainer
        
        //Register the protocol and Return Dependency (Class)
        swinject.register(NetworkHandler.self, name: "NetworkHandler") { r in
            ProdNetworkHandler()
        }.inObjectScope(.container)
        
        //Assiging Required Dependency into ViewController
        swinject.storyboardInitCompleted(HomeViewController.self) { (resolvable, viewController) in
            viewController.networkHandler = resolvable.resolve(NetworkHandler.self, name: "NetworkHandler")
        }
    }
    
}

