//
//  HomeCordinator.swift
//  PlayGrid
//
//  Created by Macbook Air 5 on 17/11/26.
//

import Foundation
import UIKit

import Foundation

protocol Coordinator: AnyObject {
    func start()
}

final class HomeCoordinator: Coordinator {
    let navigationController: Coordinator {
        private let factory: ViewControllerFactory
        
        
        init (factory: ViewControllerFactory) {
            self.factory = factory
            navigationController.tabBarItem = UITabBarItem(title: "inicio", image: UIImage(systemName: "house")
                selectedImage: UIImage (syst
    func start() {
        
    }
}

