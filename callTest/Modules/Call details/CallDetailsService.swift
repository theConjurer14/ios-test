//
//  CallDetailsService.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import Foundation

protocol CallDetailsServiceProtocol {
    func getCallDetails(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void)
    func archiveCall(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void)
}

final class CallDetailsService: CallDetailsServiceProtocol {
    private let networkRequester: NetworkRequester
    
    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }
    
    func getCallDetails(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void) {
        let getCallDetailsRequest = CallDetailsRequest.getDetails(id: id)
        let request = NetworkRequest.init(apiRequest: getCallDetailsRequest)
        
        networkRequester.requestService(request: request) { (result: Result<Call, Error>) in
            switch result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func archiveCall(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void) {
        let archiveCallRequest = CallDetailsRequest.archiveCall(id: id)
        let request = NetworkRequest.init(apiRequest: archiveCallRequest)
        
        networkRequester.requestService(request: request) { (result: Result<Call, Error>) in
            switch result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
}
