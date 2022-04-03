//
//  LoginRO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 31/03/22.
//

import Foundation

struct LoginRO: Codable {
    let token: String
    let expiresIn: String
    
    enum CodingKeys: String, CodingKey {
        case token = "plain-text-token"
        case expiresIn = "1h"
    }
}
