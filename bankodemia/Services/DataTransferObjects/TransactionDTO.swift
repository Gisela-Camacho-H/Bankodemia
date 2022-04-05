//
//  TransactionDTO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

struct TransactionDTO: Codable {
    let amount: Int
    let type: String
    let concept: String
    let destinationUser: String?
}
