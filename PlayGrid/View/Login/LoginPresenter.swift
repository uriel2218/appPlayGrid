//
//  File.swift
//  PlayGrid
//
//  Created by Mac Book  Air 4 on 13/10/26.
//

import Foundation

protocol LoginView: AnyObject{
    
}

final class LoginPresenter{
    weak var view: LoginView?
    private let onLoginSucces: () -> Void
    
    init(onLoginSuccess: @escaping () -> Void) {
        self.onLoginSucces = onLoginSuccess
    }
}
