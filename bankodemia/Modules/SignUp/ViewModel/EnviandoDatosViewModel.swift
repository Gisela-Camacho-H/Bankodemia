//
//  EnviandoDatosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation
import UIKit

class EnviandoDatosViewModel: SignupViewModelProtocol {
    var signupViewController: SignupViewControllerProtocol?
    var signupAPIDataManager: SignupAPIDataManagerProtocol?
    
    var enviandoDatosViewController: EnviandoDatosViewController?
    var registerData: RegisterData?
    var ApiDataManager: SignupAPIDataManagerProtocol = SignupModuleAPIDataManager()
    
    func setViewControllerConnection(viewController: SignupViewControllerProtocol) {
        self.signupViewController = viewController
    }
    
    func tapOnLoginButtonWithInputs(email: String?, name: String?, lastName: String?, birthDate: String?, password: String?, identityImage: String?, identityImageType: String?, occupation: String?) {
        return
    }
    
    func performRequest(){
        
        guard let identityImage = registerData?.identityImage, let email = registerData?.email,
        let name = registerData?.name, let lastName = registerData?.lastName, let birthday = registerData?.birthDate,
        let password = registerData?.countersign, let occupation = registerData?.ocupation, let phone = registerData?.phone
        else{ return }
        let resizeImage = resizeImage(image: identityImage, targetSize: CGSize(width: 50, height: 50))
        
        guard let identityType = registerData?.identityImageType?.rawValue,
        let image64 = resizeImage?.pngData()!.base64EncodedString(options: .endLineWithCarriageReturn) else { return }
        
        ApiDataManager.viewModel = self
        ApiDataManager.performLogin(email: email, name: name , lastName: lastName, birthDate: birthday, password: password, identityImage: image64, identityImageType: identityType, occupation: occupation, phone: phone)
        
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}

extension EnviandoDatosViewModel : SignupAPIDataManagerOutputProtocol {
    func didPerformSignup() {
        enviandoDatosViewController?.timeaction()
    }
}
