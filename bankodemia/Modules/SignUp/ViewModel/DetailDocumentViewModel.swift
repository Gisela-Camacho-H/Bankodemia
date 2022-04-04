//
//  DetailDocumentViewModel.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation
import UIKit

class DetailDocumentViewModel {

var detailDocumentViewController: DetailDocumentViewController?
var registerData: RegisterData?
    
    func validateAndProcessInputData(identityImage: UIImage) {
            
            registerData?.identityImage = identityImage
            guard let registerData = registerData else {
                return
            }
            print(registerData)
            detailDocumentViewController?.continueToNextView(withData: registerData)
    }
    
}
