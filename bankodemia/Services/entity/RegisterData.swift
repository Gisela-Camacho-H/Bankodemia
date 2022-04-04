//
//  RegisterData.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation
import UIKit

struct RegisterData {
    var email: String?
    var name: String?
    var lastName: String?
    var birthDate: String?
    var countersign: String?
    var identityImage: UIImage?
    var identityImageType: IdentityImageType?
    var ocupation: String?
    var phone: String?
    
}


enum IdentityImageType: String {
    case ine = "INE"
    case passport = "PASSPORT"
    case migrationForm = "MIGRATION_FORM"
}
