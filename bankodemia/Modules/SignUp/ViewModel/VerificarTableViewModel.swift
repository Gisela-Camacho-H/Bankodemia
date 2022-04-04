//
//  VerificarTableViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

class VerificarTableViewModel {

var verificarTableViewController: VerificarTableViewController?
var registerData: RegisterData?
    
    func validateAndProcessInputData(identityImageType: IdentityImageType ) {
            
            registerData?.identityImageType = identityImageType
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            verificarTableViewController?.continueToNextView(withData: registerData)
    }
    
}
