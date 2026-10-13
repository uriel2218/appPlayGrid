//
//  LoginViewController.swift
//  PlayGrid
//
//  Created by Mac Book  Air 4 on 29/09/26.
//

import UIKit

class LoginViewController: UIViewController {
    private let presenter: LoginPresenter
    init (presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
