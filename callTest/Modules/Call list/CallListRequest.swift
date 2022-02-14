//
//  CallListRequest.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation

enum CallListRequest {
    case getCallList
    case resetCallList
}

extension CallListRequest: APIRequest {
    var path: APIPaths {
        switch self {
        case .getCallList:
            return .getCallList
        case .resetCallList:
            return .resetCallList
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCallList, .resetCallList:
            return .get
        }
    }
}
