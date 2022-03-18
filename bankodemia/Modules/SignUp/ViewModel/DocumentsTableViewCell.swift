//
//  DocumentsTableViewCell.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import Foundation
import UIKit
 

class DocumentTableViewCell: UITableViewCell{

    
    var nameDocument: UILabel?
    var nextButton: UIButton?
    var documentArray = ["INE", "Documento Migratorio", "Pasaporte"]
    

   /* init(){
        self.nameDocument = UILabel()
        self.nextButton = UIButton()
        contentView.addSubview(nameDocument!)
        contentView.addSubview(nextButton!)
    
        
    }*/
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameDocument?.removeFromSuperview()
        nextButton?.removeFromSuperview()
        nameDocument = nil
        nextButton = nil
    }
    
}


