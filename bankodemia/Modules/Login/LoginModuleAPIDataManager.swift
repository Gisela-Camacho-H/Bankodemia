//
//  LoginModuleAPIDataManager.swift
//  bankodemia
//
//  Created by GiselaCamacho on 03/04/22.
//

import Foundation

class LoginAPIDataManager: LoginAPIDataManagerProtocol {
    
    var serviceBuilder: ServicesBuilderProtocol = ServiceBuilder()
    weak var viewModel: LoginAPIDataManagerOutputProtocol?
    private var dataTask: URLSessionDataTask?
    
    
    func performLogin(userEmail: String, countersign: String) {
        dataTask?.cancel()
        let loginDTO: LoginDTO = LoginDTO(email: userEmail, countersign: countersign)
        dataTask = serviceBuilder.set(endpoint: .login(loginDTO))
            .set(completionHandler: {[weak self] response in
                
                switch response {
                case .success(let data):
                    guard let responseObject: LoginRO = DataParser().parseData(unparsedData: data) else {
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
    
    private func processSuccess(responseObject: LoginRO) {
        self.viewModel?.didPerformLogin(with: responseObject.token)
    }
    
    private func processFailure(networkError: NetworkError?, error: Error?) {
        
    }
}
