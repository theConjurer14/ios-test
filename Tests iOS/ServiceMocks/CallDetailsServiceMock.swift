//
//  CallDetailsServiceMock.swift
//  callTest
//
//  Created by Marcos Sabarís on 14/2/22.
//

import Foundation

class CallDetailsServiceMock: CallDetailsServiceProtocol {
    var success: Bool = false
    
    func getCallDetails(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void) {
        if success {
            completionHandler(.success(Call.callMock))
        } else {
            completionHandler(.failure(RuntimeError("Mock error")))
        }
    }
    
    func archiveCall(id: Int, completionHandler: @escaping (Result<Call, Error>) -> Void) {
        if success {
            completionHandler(.success(Call.callMock))
        } else {
            completionHandler(.failure(RuntimeError("Mock error")))
        }
    }
    
    
}
