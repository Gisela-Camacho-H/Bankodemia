//
//  UserDetailViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation

class UserDetailViewModel: UserDetailViewModelProtocol {
    
    var apiDataManager: UserDetailAPIDataManagerProtocol? = UserDetailAPIDataManager()
    var localDataManager: UserDetailLocalDataManagerProtocol? = UserDetailLocalDataManager()
    weak var viewController: UserDetailViewControllerProtocol?
    
    func setViewControllerConnection(_ viewController: UserDetailViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func fetchUserData() {
        guard let token: String = localDataManager?.obtainStoredToken() else {
            return
        }
        apiDataManager?.viewModel = self
        apiDataManager?.fetchUserData(with: token)
    }
    
    func onLogOutTap() {
        guard let token: String = localDataManager?.obtainStoredToken() else {
            return
        }
        apiDataManager?.viewModel = self
        apiDataManager?.performLogOut(with: token)
    }
}

extension UserDetailViewModel: UserDetailAPIDataManagerOutputProtocol {
    func didObtainedUserData(user: UserRO) {
        viewController?.updateUIWithInfo(balance: user.data.balance, email: user.data.user.email, id: user.data.transactions[0]._id)
    }
    
    func didLogOutUser() {
        viewController?.dismissToLogin()
    }
}
