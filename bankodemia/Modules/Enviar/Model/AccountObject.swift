//
//  CuentasClientes.swift
//  bankodemia
//
//  Created by Adriana Limon on 3/25/22.
//

import UIKit

var accountArray = [Account]().self

class Account {
    
    var clientName : String?
    var accountNumber : String?
    var bankEntity : String?
    
    init(clientName : String, accountNumber : String, bankEntity : String){
        self.clientName = clientName
        self.accountNumber = accountNumber
        self.bankEntity = bankEntity
    }
}
