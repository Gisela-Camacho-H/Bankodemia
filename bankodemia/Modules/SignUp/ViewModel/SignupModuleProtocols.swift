//
//  SignupModuleProtocols.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation
import UIKit

protocol SignupViewModelProtocol {
    var signupViewController: SignupViewControllerProtocol? { get set }
    var signupAPIDataManager: SignupAPIDataManagerProtocol? { get set }
    
    func setViewControllerConnection(viewController: SignupViewControllerProtocol)
    func tapOnLoginButtonWithInputs(email: String?, name:  String?, lastName:  String?, birthDate:  String?, password:  String?, identityImage:  String?, identityImageType:  String?, occupation: String?)
}

protocol SignupViewControllerProtocol: UIViewController {
    var SignupViewModel: SignupViewModelProtocol? { get set }
    func setViewModelConnection(viewModel: SignupViewModelProtocol)
    func nextView()
}

protocol SignupAPIDataManagerProtocol {
    var viewModel: SignupAPIDataManagerOutputProtocol? { get set }
    func performLogin(email: String, name:  String, lastName:  String, birthDate:  String, password:  String, identityImage:  String, identityImageType:  String, occupation: String, phone: String)
}

protocol SignupAPIDataManagerOutputProtocol: AnyObject{
     func didPerformSignup()
}
