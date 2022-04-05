//
//  UserDetailProtocols.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation
import UIKit

protocol UserDetailViewModelProtocol {
    var apiDataManager: UserDetailAPIDataManagerProtocol? { get set }
    var localDataManager: UserDetailLocalDataManagerProtocol? { get set }
    var viewController: UserDetailViewControllerProtocol? { get set }
    
    func setViewControllerConnection(_ viewController: UserDetailViewControllerProtocol)
    func fetchUserData()
}

protocol UserDetailViewControllerProtocol: UIViewController {
    var viewModel: UserDetailViewModelProtocol? { get set }
    
    func setViewModelConnection(_ viewModel: UserDetailViewModelProtocol)
    func updateUIWithInfo(balance: Double)
    func dismissToLogin()
}

protocol UserDetailAPIDataManagerProtocol {
    var viewModel: UserDetailAPIDataManagerOutputProtocol? { get set }
    
    func fetchUserData(with bearer: String)
}

protocol UserDetailAPIDataManagerOutputProtocol: AnyObject {
    func didObtainedUserData(user: UserRO)
}

protocol UserDetailLocalDataManagerProtocol {
    func obtainStoredToken() -> String?
}

