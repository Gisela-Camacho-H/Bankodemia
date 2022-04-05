//
//  TransactionTableViewCell.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/4/22.
//

import UIKit

class TransactionTableViewCell : UITableViewCell{
    
    var transactionConcept : UILabel?
    var transactionHour : UILabel?
    var transactionQuantity : UILabel?
    
    
    var transaccion : TransactionObject?

        
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    
    init(transaccion : TransactionObject) {
        super.init(style: .default, reuseIdentifier: nil)
        self.transaccion = transaccion
        self.backgroundColor = .white
        
        initUI()
    }
    
    func initUI(){
        
        transactionConcept = UILabel(frame: CGRect(x: 20, y: 7, width: 180, height: 20))
        transactionConcept?.text = transaccion?.transactionConcept
        transactionConcept?.font = UIFont(name: "Poppins-SemiBold", size: 14)
        transactionConcept?.textAlignment = .left
        transactionConcept?.backgroundColor = .clear
        transactionConcept?.textColor = UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1)
        self.addSubview(transactionConcept!)
        
        transactionQuantity = UILabel(frame: CGRect(x: width - 120, y: 7, width: 100, height: 20))
        transactionQuantity?.text = transaccion?.transactionQuantity
        transactionQuantity?.font = UIFont(name: "Poppins-Medium", size: 14)
        transactionQuantity?.textAlignment = .right
        transactionQuantity?.backgroundColor = .clear
        transactionQuantity?.textColor = UIColor(red: 0, green: 204/255, blue: 204/255, alpha: 1)
        self.addSubview(transactionQuantity!)
        
        transactionHour = UILabel(frame: CGRect(x: 20, y: 28, width: width / 1.6, height: 20))
        transactionHour?.text = transaccion?.transactionHour
        transactionHour?.font = UIFont(name: "Poppins-Medium", size: 14)
        transactionHour?.textAlignment = .left
        transactionHour?.backgroundColor = .clear
        transactionHour?.textColor = UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1)
        self.addSubview(transactionHour!)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
