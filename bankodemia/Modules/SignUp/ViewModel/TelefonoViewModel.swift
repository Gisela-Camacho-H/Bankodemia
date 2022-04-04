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
    
    
    func validateAndProcessInputData(phone: String) {
            
            guard phone != ""
            else {
             print("Ingrese numero telefonico")
                return
            }
            registerData?.phone = phone
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            telefonoViewController?.continueToNextView(withData: registerData)
    }
}
