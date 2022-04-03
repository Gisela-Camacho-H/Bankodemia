//
//  Endpoints.swift
//  bankodemia
//
//  Created by GiselaCamacho on 31/03/22.
//

import Foundation

enum Endpoint {
    case login(LoginDTO)
    case register(RegisterDTO)
    case listUsers
    case searchUsers
    case getUsers(Int)
    case fullProfile
    case makeTransaction(TransactionDTO)
    case listTransactions
    case transactionDetail(Int)
    
    
    var path: String {
        switch self {
        case .login(_): return "auth/login"
        case .register(_): return "users"
        case .listUsers: return "users"
        case .searchUsers: return "users/search"
        case .getUsers(let id): return "users/\(id)"
        case .fullProfile: return "users/me/profile"
        case .makeTransaction(_): return "transactions"
        case .listTransactions: return "transactions/me"
        case .transactionDetail(let id): return "transaction/\(id)"
        }
    }
    
    var method: String {
        switch self {
        case .login(_), .register(_), .makeTransaction(_):
            return "POST"
        case .listUsers, .searchUsers, .getUsers(_), .fullProfile, .listTransactions, .transactionDetail(_):
            return "GET"
        }
    }
    
}
