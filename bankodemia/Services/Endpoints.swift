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
    case listUsers(token: String)
    case searchUsers(token: String)
    case getUsers(Int)
    case fullProfile(token: String)
    case makeTransaction(TransactionDTO, token: String)
    case listTransactions(token: String)
    case transactionDetail(Int)
    case saveContacts(ContactsDTO)
    case listContacts(token: String)
    case getContact(token: String)
    
    
    var path: String {
        switch self {
        case .login(_): return "auth/login"
        case .register(_): return "users"
        case .listUsers: return "users"
        case .searchUsers: return "users/search"
        case .getUsers(let id): return "users/\(id)"
        case .fullProfile(_): return "users/me/profile"
        case .makeTransaction(_): return "transactions"
        case .listTransactions: return "transactions/me"
        case .transactionDetail(let id): return "transaction/\(id)"
        case .saveContacts(_): return "contacts"
        case .listContacts: return "contacts"
        case .getContact(let id): return "contacts/\(id)"
        }
    }
    
    var method: String {
        switch self {
        case .login(_), .register(_), .makeTransaction(_), .saveContacts(_):
            return "POST"
        case .listUsers, .searchUsers, .getUsers(_), .fullProfile, .listTransactions, .transactionDetail(_), .listContacts, .getContact:
            return "GET"
        }
    }
    
}
