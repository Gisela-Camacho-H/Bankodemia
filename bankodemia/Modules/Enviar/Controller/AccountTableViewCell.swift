//
//  AccountTableViewCell.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/2/22.
//

import UIKit
 
class AccountTableViewCell : UITableViewCell{
    
    var nameAccount : UILabel?
    var numberAccount : UILabel?
    var bankEntity : UILabel?
    
    
    var cuenta : Account?

        
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    
    init(cuenta : Account) {
        super.init(style: .default, reuseIdentifier: nil)
        self.cuenta = cuenta
        self.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        nameAccount = UILabel(frame: CGRect(x: 20, y: 7, width: width / 1.6, height: 20))
        nameAccount?.text = cuenta?.clientName
        nameAccount?.font = UIFont(name: "Poppins-SemiBold", size: 14)
        nameAccount?.textAlignment = .left
        nameAccount?.backgroundColor = .clear
        self.addSubview(nameAccount!)
        
        numberAccount = UILabel(frame: CGRect(x: 20, y: 28, width: width / 1.6, height: 20))
        numberAccount?.text = (cuenta?.accountNumber)! + " / " + (cuenta?.bankEntity)!
        numberAccount?.font = UIFont(name: "Poppins-Medium", size: 14)
        numberAccount?.textAlignment = .left
        numberAccount?.backgroundColor = .clear
        numberAccount?.textColor = UIColor(red: 0.384, green: 0.384, blue: 0.384, alpha: 1)
        self.addSubview(numberAccount!)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

