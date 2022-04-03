//
//  LoginModuleProtocols.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation
import UIKit

protocol LoginViewModelProtocol {
    var loginViewController: LoginViewControllerProtocol? { get set }
    var loginAPIDataManager: LoginAPIDataManagerProtocol? { get set }
    var loginLocalDataManager: LoginLocalDataManagerProtocol? { get set }
    
    func setViewControllerConnection(viewController: LoginViewControllerProtocol)
    func tapOnLoginButtonWithInputs(countersign: String?, userEmail: String?)
}

protocol LoginViewControllerProtocol: UIViewController {
    var loginViewModel: LoginViewModelProtocol? { get set }
    func setViewModelConnection(viewModel: LoginViewModelProtocol)
    func continueToUserDetailView()
}

protocol LoginAPIDataManagerProtocol {
    var viewModel: LoginAPIDataManagerOutputProtocol? { get set }
    func performLogin(userEmail: String, countersign: String)
}

protocol LoginAPIDataManagerOutputProtocol: AnyObject {
    func didPerformLogin(with bearerToken: String)
}

protocol LoginLocalDataManagerProtocol {
    func store(bearerToken: String)
}
