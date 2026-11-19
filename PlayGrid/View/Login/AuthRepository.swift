//
//  AuthRepository.swift
//  PlayGrid
//
//  Created by Macbook Air 5 on 03/11/26.
//

import Foundation
import FirebaseAuth

protocol AuthRepositoryProtocol {
    var currentUser: User? { get }
    func signIn(email: String, password: String) async throws -> User
    func signUp(name: String, email: String, password: password) async throws -> User
    func signOut() throws
}

final class FirebaseAuthRepository: AuthRepositoryProtocol {
    private let auth:
    
    
    

    
    
}

//completar codigo

//se necesitan arreglar errores
