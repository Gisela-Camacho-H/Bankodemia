//
//  LoginModuleLocalDataManager.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

class LoginModuleLocalDataManager: LoginLocalDataManagerProtocol {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    func store(bearerToken: String) {
        userDefaults.setValue(bearerToken, forKey: "token")
    }
}
