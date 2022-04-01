//
//  LoginRO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 31/03/22.
//

import Foundation

struct LoginRO: Codable {
    let plainTextToken: String
    enum CodingKeys: String, CodingKey {
        case plainTextToken = "plain-text-token"
    }
}
