//
//  WelcomeViewController.swift
//  PlayGrid
//
//  Created by Macbook Air 5 on 08/10/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let presenter: WelcomePresenter
    init (presenter: WelcomePresenter) {
        self.presenter = presenter
        super.init(nibName: "WelcomeViweController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}
