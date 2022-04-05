//
//  EnviarModuleLocalDataManager.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation

class EnviarModuleLocalDataManager: EnviarLocalDataManagerProtocol {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    func store(bearerToken: String) {
        userDefaults.setValue(bearerToken, forKey: "token")
    }
}
