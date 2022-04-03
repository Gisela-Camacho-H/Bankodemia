//
//  TransactionRO.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

struct FullUserRO: Codable {
        let success: Bool
        let data: userData
    }

    // MARK: - DataClass
    struct userData: Codable {
        let user: User
        let transactions: [Transaction]
        let balance: Double
    }

    // MARK: - Transaction
    struct Transaction: Codable {
        let _id: String
        let amount: Double
        let type: String
        let concept: String
        let created_at: String
        let issuer: User
        let destinationUser: User?
        let isIncome: Bool
    }

    // MARK: - User
    struct User: Codable {
        let _id, email, name, lastName: String
    }
    
    enum CodingKeys: String, CodingKey {
        case success
        case data
        
    }
