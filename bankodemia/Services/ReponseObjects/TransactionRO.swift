//
//  TransactionRO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation

// MARK: - TransactionsRO
struct TransactionsRO: Codable {
    let success: Bool
    let data: DataTransaction
}

// MARK: - DataClass
struct DataTransaction: Codable {
    let transaction: MakeTransaction
    let finalBalance: Int
}

// MARK: - Transaction
struct MakeTransaction: Codable {
    let id, concept: String
    let destinationUser, issuer: DestinationUser
    let type: String
    let amount: Int
    let createdAt: String
    let v: Int
}

// MARK: - DestinationUser
struct DestinationUser: Codable {
    let id, lastName, name, email: String
    let v: Int

}
