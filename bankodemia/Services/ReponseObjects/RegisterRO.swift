//
//  RegisterRO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

// MARK: - SignupRO
struct RegisterRO: Codable {
    let success: Bool
    let data: DataSignup
}

// MARK: - DataClass
struct DataSignup: Codable {
    let user: UserSignup
}

// MARK: - User
struct UserSignup: Codable {
    let identityImageType, identityImage: String
    let isPhoneVerified: Bool
    let phone, password, birthDate, occupation: String
    let lastName, name, email, id: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case identityImageType, identityImage, isPhoneVerified, phone, password, birthDate, occupation, lastName, name, email
        case id = "_id"
        case v = "__v"
    }
}
