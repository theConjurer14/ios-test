//
//  CallListServiceMock.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import Foundation


class CallListServiceMock: CallListServiceProtocol {
    var success: Bool = false
    
    func archiveCall(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void) {
        if success {
            completionHandler(.success(Call.callMock))
        } else {
            completionHandler(.failure(RuntimeError("Mock error")))
        }
    }
    
    func getCallList(completionHandler: @escaping (Result<[Call], Error>) -> Void) {
        if success {
            completionHandler(.success(Call.callListMock))
        } else {
            completionHandler(.failure(RuntimeError("Mock error")))
        }
        
    }
    
    func resetCallList(completionHandler: @escaping (Result<ResetCalls, Error>) -> Void) {
        if success {
            completionHandler(.success(ResetCalls.mock))
        } else {
            completionHandler(.failure(RuntimeError("Mock error")))
        }
    }
}
