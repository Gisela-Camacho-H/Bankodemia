//
//  EnviarModuleProtocols.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation
import UIKit

protocol EnviarViewModelProtocol {
    var enviarViewController: EnviarViewControllerProtocol? { get set }
    var enviarAPIDataManager: EnviarAPIDataManagerProtocol? { get set }
    var enviarLocalDataManager: EnviarLocalDataManagerProtocol? { get set }
    
    func setViewControllerConnection(viewController: EnviarViewControllerProtocol)
    func tapOnLoginButtonWithInputs(amount: Int, type: String, concept: String, destinationUser: String?)
}

protocol EnviarViewControllerProtocol: UIViewController {
    var enviarViewModel: EnviarViewModelProtocol? { get set }
    func setViewModelConnection(viewModel: EnviarViewModelProtocol)
    func continueToUserDetailView()
}

protocol EnviarAPIDataManagerProtocol {
    var viewModel: EnviarAPIDataManagerOutputProtocol? { get set }
    func performLogin(amount: Int, type: String, concept: String, destinationUser: String?)
}

protocol EnviarAPIDataManagerOutputProtocol: AnyObject {
    func didPerformLogin(with bearerToken: String)
}

protocol EnviarLocalDataManagerProtocol {
    func store(bearerToken: String)
}
