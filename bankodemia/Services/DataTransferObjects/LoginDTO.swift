//
//  LoginDTO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 31/03/22.
//

import Foundation

struct LoginDTO: Codable {
    let email: String
    let countersign: String
    let deviceName: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case countersign = "password"
        case deviceName = "device_name"
    }
}
