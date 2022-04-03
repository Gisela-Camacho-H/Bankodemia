
import Foundation

class LoginViewModel: LoginViewModelProtocol {
    
    weak var loginViewController: LoginViewControllerProtocol?
    var loginLocalDataManager: LoginLocalDataManagerProtocol? = LoginModuleLocalDataManager()
    var loginAPIDataManager: LoginAPIDataManagerProtocol? = LoginAPIDataManager()
    
    func setViewControllerConnection(viewController: LoginViewControllerProtocol) {
        self.loginViewController = viewController
    }
    
    func tapOnLoginButtonWithInputs(countersign: String?, userEmail: String?) {
        guard let countersign = countersign,
            let user = userEmail else {
            return
        }
        guard countersign != "",
              user != "" else {
            return
        }
        loginAPIDataManager?.viewModel = self
        loginAPIDataManager?.performLogin(userEmail: user, countersign: countersign)
    }
    
    func tapOnSignInButton() {
        loginViewController?.continueToUserDetailView()
    }
    
}

extension LoginViewModel: LoginAPIDataManagerOutputProtocol {
    func didPerformLogin(with bearerToken: String) {
        loginLocalDataManager?.store(bearerToken: bearerToken)
        loginViewController?.continueToUserDetailView()
    }
}
