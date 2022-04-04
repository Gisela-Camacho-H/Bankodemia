//
//  ContrasenaViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation
class ContrasenaViewModel {

var contrasenaViewController: ContrasenaViewController?
var registerData: RegisterData?
    
    func validateAndProcessInputData(countersign: String) {
            
        registerData?.countersign = countersign
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            contrasenaViewController?.continueToNextView(withData: registerData)
    }
    
}
