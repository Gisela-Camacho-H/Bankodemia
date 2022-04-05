//
//  TransactionModel.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/4/22.
//

import UIKit

var transactionArray = [Transaction]().self

class TransactionObject {
    
    var transactionConcept : String?
    var transactionHour : String?
    var transactionQuantity : String?
    
    init(transactionConcept : String, transactionHour : String, transactionQuantity : String){
        self.transactionConcept = transactionConcept
        self.transactionHour = transactionHour
        self.transactionQuantity = transactionQuantity
    }
    
}
