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
        
        if countersign == "" {
            contrasenaViewController?.validacionTextFieldLabel.text = "Debes ingresar una contraseña"
            return
        }
            
        registerData?.countersign = countersign
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            contrasenaViewController?.continueToNextView(withData: registerData)
    }
    
}
