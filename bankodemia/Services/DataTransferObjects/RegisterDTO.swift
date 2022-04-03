//
//  RegisterDTO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

struct RegisterDTO: Codable {
    let email: String
    let name: String
    let lastName: String
    let birthDate: String
    let password: String
    let identityImage: String
    let identityImageType: String
    let occupation: String
    
    enum CodingKeys: String, CodingKey {
        case name,email, lastName, birthDate, password, identityImage, identityImageType, occupation
    }
}
