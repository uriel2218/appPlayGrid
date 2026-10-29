import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var emailErrorLabel: UILabel!
    private let presenter: LoginPresenter
    
    init(presenter: LoginPresenter) {
        self.presenter = presenter
        super.init(nibName: "LoginViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
    }
    
    @objc private func textDidChange() {
        presenter.fieldsDidChange(email: emailTextField.text ?? "",
                                  password: passwordTextField.text ?? "")
    }

    @IBAction func requestLogin(_ sender: UIButton) {
            presenter.requestLogin()
    }
    
}

extension LoginViewController: LoginView {
    func showEmailError(message: String?) {
        
    }
    
    func showPasswordError(message: String?) {
        
    }
    
    func setLoginButtonEnabled(_ isEnabled: Bool) {
        loginButton.isEnabled = isEnabled
    }
    
    func manageLoader(_ isLoading: Bool) {
            isLoading ? showLoader() : hideLoader()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            presenter.emailDidEndEditing(textField.text ?? "")
        } else {
            presenter.passwordDidEndEditing(textField.text ?? "")
        }
    }
}
