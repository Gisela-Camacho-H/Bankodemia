//
//  DocumentsTableViewCell.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit
 

class DocumentTableViewCell: UITableViewCell{

    
    var nameDocument: UILabel?
    var nextButton: UIButton?
    var documentArray = ["INE", "Documento Migratorio", "Pasaporte"]
    
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


