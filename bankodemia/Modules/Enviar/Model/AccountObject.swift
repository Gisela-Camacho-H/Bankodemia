//
//  CuentasClientes.swift
//  bankodemia
//
//  Created by Adriana Limon on 3/25/22.
//

import UIKit

class Account {
    var name : String?
    var accountNumber : String?
    var bankEntity : String?
    
    init(name : String, accountNumber : String, bankEntity : String){
        self.name = name
        self.accountNumber = accountNumber
        self.bankEntity = bankEntity
    }
}
