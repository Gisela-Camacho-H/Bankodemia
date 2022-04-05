
import Foundation
import UIKit
class SignUpViewModel{
    
    var viewController: SignUpViewController?
    
    func isValidEmail(emailID:String) -> Bool {
       let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
       let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
       return emailTest.evaluate(with: emailID)
   }
    
    func validateAndProcessInputData(email: String) {
        if email == "" {
            viewController?.validacionTextFieldLabel.text = "Debes ingresar un correo"
            return
        }
        if isValidEmail(emailID: email) {
    
        let registerData: RegisterData = RegisterData(email: email, name: nil, lastName: nil, birthDate: nil, countersign: nil, identityImage: nil, identityImageType: nil, ocupation: nil)
        print(registerData)
        viewController?.continueToNextView(withData: registerData)
        } else {
            viewController?.validacionTextFieldLabel.text = "Escribe un email valido"
        }
    }
}
