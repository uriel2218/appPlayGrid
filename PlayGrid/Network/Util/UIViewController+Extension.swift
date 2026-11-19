//
//  UIViewController+Extension.swift
//  PlayGrid
//
//  Created by MacBook 6 on 29/10/26.
//

import UIKit

extension UIViewController {
    private var loaderChild: LoaderViewController? {
        children.first { $0 is LoaderViewController } as?
        LoaderViewController
    }
    
    func showLoader() {
        guard loaderChild == nil else {return}
        
        let host: UIViewController = navigationController ?? self
        let loader = LoaderViewController(nibName: "LoaderViewController", bundle: nil)
        
        host.addChild(loader)
        loader.view.frame = view.bounds
        loader.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loader.view.alpha = 0
        host.view.addSubview(loader.view)
        loader.didMove(toParent: host)
        UIView.animate(withDuration: 0.2){
            loader.view.alpha = 1
        }
    }
    
    func hideLoader() {
        let host: UIViewController = navigationController ?? self
        guard let loader = host.children.first(where: { $0 is LoaderViewController }) else {
            return }
        
        loader.willMove(toParent: nil)
        UIView.animate(withDuration: 0.2, animations: {
            loader.view.alpha = 0
        }, completion: { _ in
            loader.view.removeFromSuperview()
            loader.removeFromParent()
        })
    }
    
    func showErrorAlert(title: String = "Error",
                        message: String,
                        buttonTitle: String = "Aceptar",
                        onDismiss: (() -> Void)? = nil) {
        
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                [weak self] in
                self?.showErrorAlert(title: title, message: message, buttonTitle: buttonTitle, onDismiss: onDismiss)
            }
            return
        }
        
        let presenter = topMostViewController ()
        guard !(presenter is UIAlertController) else {return}
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
            onDismiss?()
        }))
        presenter.present(alert, animated: true)
    }
    
    func showErrorAlert (_errror: Error),}
title: String = "Error",
onDismiss
    
    private func topMostViewController () -> UIViewController {
        if let presented = presentedViewController {
            return presented.topMostViewController()
        }
        if let navigation = self as? UINavigationController,
           let visible = navigation.visibleViewController {
            return visible.topMostViewController()
        }
        if let tabBar = self as? UITabBarController,
           let selected = tabBar.selectedViewController {
            return selected.topMostViewController()
        }
        return self
    }
}
