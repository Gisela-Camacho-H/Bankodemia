//
//  TelefonoViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

class TelefonoViewModel {

var telefonoViewController: TelefonoViewController?
var registerData: RegisterData?
    
    func isValidPhone(phone: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phone)
        }
    
    func validateAndProcessInputData(phone: String) {
            
            guard phone != ""
            else {
            telefonoViewController?.validacionTextFieldLabel.text = "Ingrese un numero telefónico"
                return
            }
        
        if isValidPhone(phone: phone){
            registerData?.phone = phone
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            telefonoViewController?.continueToNextView(withData: registerData)
        } else {
            telefonoViewController?.validacionTextFieldLabel.text = "Escribe un número valido"
        }
    }
}
