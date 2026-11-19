//
//  AuthError.swift
//  PlayGrid
//
//  Created by Macbook Air 5 on 03/11/26.
//

import Foundation

enum AuthError: LocalizedError{
    case invalidCredentials
    case emaiAlreadyInUse
    case network
    case unknown(Message)
    
    var errorDescription: String?{
        switch self {
            case .invalidCredentials:
            return "Invalid credentials"
        case .emaiAlreadyInUse:
            return "Email already in use"
        case .network:
            return "Network error"
        case .unknown:
            return "Unknown error"
        }
    }
}
