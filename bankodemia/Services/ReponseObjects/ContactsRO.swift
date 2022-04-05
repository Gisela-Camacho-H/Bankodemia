//
//  ContactsRO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation

// MARK: - ContactsRO
struct ContactsRO: Codable {
    let success: Bool
    let data: DataContacts
}

// MARK: - DataClass
struct DataContacts: Codable {
    let user: UserContacts
}

// MARK: - User
struct UserContacts: Codable {
    let id, lastName, name, email: String
    let v: Int
}
