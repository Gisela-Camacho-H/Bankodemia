//
//  EnviarViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation

class EnviarViewModel: EnviarViewModelProtocol {
    
    weak var enviarViewController: EnviarViewControllerProtocol?
    var enviarLocalDataManager: EnviarLocalDataManagerProtocol? = EnviarModuleLocalDataManager()
    var enviarAPIDataManager: EnviarAPIDataManagerProtocol? = EnviarAPIDataManager()
    
    func setViewControllerConnection(viewController: EnviarViewControllerProtocol) {
        self.enviarViewController = viewController
    }
    
    func tapOnLoginButtonWithInputs(amount: Int, type: String, concept: String, destinationUser: String?) {
        guard
        let destinationUser = destinationUser
        else {
            return
        }
        guard destinationUser != "" else {
            return
        }
        enviarAPIDataManager?.viewModel = self
        enviarAPIDataManager?.performLogin(amount: amount, type: type, concept: concept, destinationUser: destinationUser)
    }
    
    func tapOnSignInButton() {
        enviarViewController?.continueToUserDetailView()
    }
    
}

extension EnviarViewModel: EnviarAPIDataManagerOutputProtocol {
    func didPerformLogin(with bearerToken: String) {
        enviarLocalDataManager?.store(bearerToken: bearerToken)
        enviarViewController?.continueToUserDetailView()
    }
}
