//
//  WelcomePresenter.swift
//  PlayGrid
//
//  Created by Mac Book  Air 4 on 13/10/26.
//

import Foundation

protocol WelcomePresenter: AnyObject {
    
}

final class WelcomePresenterImplementation: WelcomePresenter {
    private let onShowLogin: () -> Void
    
    init(onShowLogin: @escaping () -> Void) {
        self.onShowLogin = onShowLogin
    }
}
