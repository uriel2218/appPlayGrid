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
        let viewController = factory.makeWelcomeViewController { [weak self] in
            self?.showLogin()
        }
        navigationController.viewControllers = [viewController]
    }
    
    private func showLogin() {
        let viewController = factory.makeLoginViewController { [weak self] in
            // Handle success login navigation
            print("Login success")
        }
        navigationController.pushViewController(viewController, animated: true)
    }
        
}

protocol ViewControllerFactory {
    func makeWelcomeViewController(onShowLogin: @escaping () -> Void) -> UIViewController
    func makeLoginViewController(onLoginSuccess: @escaping () -> Void) -> UIViewController
}

final class AppDIContainer: ViewControllerFactory {
    func makeWelcomeViewController(onShowLogin: @escaping () -> Void) -> UIViewController {
        let presenter = WelcomePresenterImplementation(onShowLogin: onShowLogin)
        return WelcomeViewController(presenter: presenter)
    }
    
    func makeLoginViewController(onLoginSuccess: @escaping () -> Void) -> UIViewController {
        let validator = LoginValidator()
        let presenter = LoginPresenter(onLoginSuccess: onLoginSuccess, validator: validator)
            
        return LoginViewController(presenter: presenter)
    }
}
