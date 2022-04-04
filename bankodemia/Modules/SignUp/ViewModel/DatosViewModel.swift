//
//  DatosViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

class DatosViewModel {
    
    var DatosViewController: DatosViewController?
    var registerData: RegisterData?
    
        func validateAndProcessInputData(name:String, lastName: String, birthDate: String, ocupation: String) {
            
            guard name != "", lastName != "", birthDate != "", ocupation != ""
            else {
             print("Ingrese todos los datos")
                return
            }
            registerData?.name = name
            registerData?.lastName = lastName
            registerData?.birthDate = birthDate
            registerData?.ocupation = ocupation
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            DatosViewController?.continueToNextView(withData: registerData)
    }
}
