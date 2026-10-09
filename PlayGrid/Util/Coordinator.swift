//
//  Coordinator.swift
//  PlayGrid
//
//  Created by Macbook Air 5 on 08/10/26.
//

import UIKit

final class AppCoordinator { //ejecuta las vistas
    private let navigationController: UINavigationController
    private let factory: ViewControllerFactory
    
    
    init(navigationController: UINavigationController, factory: ViewControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let ViewController = factory.makeWelcomeViewController()
        navigationController.viewControllers = [ViewController]
    }
}

protocol ViewControllerFactory { //se declara
    func makeWelcomeViewController() -> UIViewController
}

final class AppDIContainer: ViewControllerFactory { //se implementa
    func makeWelcomeViewController() -> UIViewController {
        WelcomeViewController()
    }
}
