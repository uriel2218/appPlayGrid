import Foundation

protocol LoginView: AnyObject {
    func showEmailError(message: String?)
    func showPasswordError(message: String?)
    func setLoginButtonEnabled(_ isEnabled: Bool)
    func manageLoader(_ isLoading: Bool)
}

final class LoginPresenter {
    weak var view: LoginView?
    private let onLoginSuccess: () -> Void
    private let validator: LoginValidatorProtocol
    private let authRepository: AuthRepositoryProtocol
    
    init(onLoginSuccess: @escaping () -> Void,
         validator: LoginValidatorProtocol,
    authRepository: AuthRepositoryProtocol) {
        self.onLoginSuccess = onLoginSuccess
        self.validator = validator
    }
    
    func emailDidEndEditing(_ email: String) {
        view?.showEmailError(message: validator.validateEmail(email)?.message)
    }
    
    func passwordDidEndEditing(_ password: String) {
        view?.showPasswordError(message: validator.validatePassword(password)?.message)
    }
    
    func fieldsDidChange(email: String, password: String) {
        let isFormValid = validator.validateEmail(email) == nil && validator.validatePassword(password) == nil
        view?.setLoginButtonEnabled(isFormValid)
    }
    
    func requestLogin(email: String) {
        view?.manageLoader(true)
        Task { @MainActor [weak self] in
            guard let self = self else { return }
            do {
                let user = try await self.authRepository.signIn(email: <#T##String#>, password: password)
                self.view?.manageLoader(false)
                self.onLoginSuccess()
            } catch {
                self.view?.manageLoader(false)
                self.view?.showEmailError(message: error.localizedDescription )
            }
        }
    }
}

//SE NECESITAN ARREGLAR ERRORES

// password : password para nosotros es String
