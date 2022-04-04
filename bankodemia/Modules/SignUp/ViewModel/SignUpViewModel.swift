
import Foundation

class SignUpViewModel{
    
    var viewController: SignUpViewController?
    
    
    func validateAndProcessInputData(email: String) {
        if email == "" {
            print("email vacio")
            return
        }
        
        let registerData: RegisterData = RegisterData(email: email, name: nil, lastName: nil, birthDate: nil, countersign: nil, identityImage: nil, identityImageType: nil, ocupation: nil)
        print(registerData)
        viewController?.continueToNextView(withData: registerData)
    }
}
