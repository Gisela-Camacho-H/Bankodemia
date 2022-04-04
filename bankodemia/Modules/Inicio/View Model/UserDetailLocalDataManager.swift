//
//  UserDetailLocalDataManager.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation
class UserDetailLocalDataManager: UserDetailLocalDataManagerProtocol {
    
    private let userDefaults: UserDefaults = UserDefaults.standard
    
    func obtainStoredToken() -> String? {
        guard let tokens = userDefaults.value(forKey: "token") as? String else { return nil }
        return tokens
    }
    
}
