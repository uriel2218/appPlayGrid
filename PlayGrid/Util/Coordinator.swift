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
    func showLogin() {
            let viewController = factory.makeLoginViewController()
            navigationController.pushViewController(viewController, animated: true)
        }
}

protocol ViewControllerFactory { //se declara
    func makeWelcomeViewController() -> UIViewController
    func makeLoginViewController(onLoginSuccess: @escaping() -> Void) -> UIViewController //Declara
}

final class AppDIContainer: ViewControllerFactory { //se implementa
    func makeWelcomeViewController() -> UIViewController {
        WelcomeViewController()
    }
    //Implementa
    func makeLoginViewController(onLoginSuccess: @escaping() -> Void) -> UIViewController {
        let presenter = LoginPresenter(onLoginSuccess: onLoginSuccess)
        LoginViewController(presenter: presenter)
    }
}
