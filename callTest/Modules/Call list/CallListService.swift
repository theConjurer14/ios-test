//
//  CallListService.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation

protocol CallListServiceProtocol {
    func getCallList(completionHandler: @escaping (Result<[Call], Error>) -> Void)
    func resetCallList(completionHandler: @escaping (Result<ResetCalls, Error>) -> Void)
    func archiveCall(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void)
}

final class CallListService: CallListServiceProtocol {
    private let networkRequester: NetworkRequester
    
    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }

    
    func getCallList(completionHandler: @escaping (Result<[Call], Error>) -> Void) {
        let getCallListRequest = CallListRequest.getCallList
        let request = NetworkRequest.init(apiRequest: getCallListRequest)
        
        networkRequester.requestService(request: request) { (result: Result<[Call], Error>) in
            switch result {
            case let .success(response):
                completionHandler(.success(response))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    func resetCallList(completionHandler: @escaping (Result<ResetCalls, Error>) -> Void) {
        let resetCallListRequest = CallListRequest.resetCallList
        let request = NetworkRequest.init(apiRequest: resetCallListRequest)
        
        networkRequester.requestService(request: request) { (result: Result<ResetCalls, Error>) in
            switch result {
            case let .success(calls):
                completionHandler(.success(calls))
            case let .failure(error):
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
