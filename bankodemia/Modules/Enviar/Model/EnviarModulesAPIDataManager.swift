//
//  EnviarModulesAPIDataManager.swift
//  bankodemia
//
//  Created by GiselaCamacho on 04/04/22.
//


import Foundation

class EnviarAPIDataManager: EnviarAPIDataManagerProtocol {
    
    
    var serviceBuilder: ServicesBuilderProtocol = ServiceBuilder()
    weak var viewModel: EnviarAPIDataManagerOutputProtocol?
    private var dataTask: URLSessionDataTask?
    
    
    func performLogin(amount: Int, type: String, concept: String, destinationUser: String?) {
        dataTask?.cancel()
        let transactionDTO: TransactionDTO = TransactionDTO(amount: amount, type: type, concept: concept, destinationUser: destinationUser)
        dataTask = serviceBuilder.set(endpoint: .makeTransaction(transactionDTO, token: ""))
            .set(completionHandler: {[weak self] response in
                
                switch response {
                case .success(let data):
                    guard let responseObject: TransactionsRO = DataParser().parseData(unparsedData: data) else {
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
    
    private func processSuccess(responseObject: TransactionsRO) {
        //self.viewModel?.didPerformLogin(with: responseObject.token)
    }
    
    private func processFailure(networkError: NetworkError?, error: Error?) {
        
    }
}
