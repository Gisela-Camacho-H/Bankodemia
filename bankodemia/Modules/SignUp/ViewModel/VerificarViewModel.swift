//
//  VerificarViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

class VerificarViewModel {

var verificarViewController: VerificarViewController?
var registerData: RegisterData?
    
    func validateAndProcessInputData() {
            
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            verificarViewController?.continueToNextView(withData: registerData)
    }
}
