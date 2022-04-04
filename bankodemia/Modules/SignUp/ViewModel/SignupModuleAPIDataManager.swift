//
//  signupModuleAPIDataManager.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

class SignupModuleAPIDataManager: SignupAPIDataManagerProtocol {
    
    var serviceBuilder: ServicesBuilderProtocol = ServiceBuilder()
    weak var viewModel: SignupAPIDataManagerOutputProtocol?
    private var dataTask: URLSessionDataTask?
    
    
    func performLogin(email: String, name: String, lastName: String, birthDate: String, password: String, identityImage: String, identityImageType: String, occupation: String, phone: String) {
        dataTask?.cancel()
        let registerDTO: RegisterDTO = RegisterDTO(email: email, name: name, lastName: lastName, birthDate: birthDate, password: password, identityImage: identityImage, identityImageType: identityImageType, occupation: occupation, phone: phone)
        dataTask = serviceBuilder.set(endpoint: .register(registerDTO))
            .set(completionHandler: {[weak self] response in
                
                switch response {
                case .success(let data):
                    guard let responseObject: RegisterRO = DataParser().parseData(unparsedData: data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.processSuccess(responseObject: responseObject)
                    }
                case .fail(let networkError, let error):
                    DispatchQueue.main.async {
                        self?.processFailure(networkError: networkError, error: error)
                    }
                }
            })
            .createService()
        dataTask?.resume()
    }
    
    private func processSuccess(responseObject: RegisterRO) {
        self.viewModel?.didPerformSignup()
    }
    
    private func processFailure(networkError: NetworkError?, error: Error?) {
        
    }
}
