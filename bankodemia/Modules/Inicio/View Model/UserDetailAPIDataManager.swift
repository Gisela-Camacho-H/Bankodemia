//
//  UserDetailAPIDataManager.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//

import Foundation

class UserDetailAPIDataManager: UserDetailAPIDataManagerProtocol {
    
    var serviceBuilder: ServicesBuilderProtocol = ServiceBuilder()
    private var dataTask: URLSessionDataTask?
    weak var viewModel: UserDetailAPIDataManagerOutputProtocol?
    
    func fetchUserData(with bearer: String) {
        dataTask?.cancel()
        dataTask = serviceBuilder.set(endpoint: .fullProfile(token: bearer))
            .set(completionHandler: {[weak self] response in
                switch response {
                case .success(let data):
                    guard let userRO: UserRO = DataParser().parseData(unparsedData: data) else {
                        return
                    }
                    DispatchQueue.main.async {
                        self?.processSuccessData(userRO: userRO)
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
    
    private func processSuccessData(userRO: UserRO) {
        self.viewModel?.didObtainedUserData(user: userRO)
    }
    
    private func processFailure(networkError: NetworkError?, error: Error?) {
        
    }
    
    func performLogOut(with bearer: String) {
        dataTask?.cancel()
        dataTask = serviceBuilder.set(endpoint: .fullProfile(token: bearer))
            .createService()
        dataTask?.resume()
        viewModel?.didLogOutUser()
    }
    
}

