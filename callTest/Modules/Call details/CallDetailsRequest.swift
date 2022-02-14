//
//  CallDetailsRequest.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import Foundation

enum CallDetailsRequest {
    case getDetails(id: Int)
    case archiveCall(id: Int)
}

extension CallDetailsRequest: APIRequest {
    var path: APIPaths {
        switch self {
        case let .getDetails(id):
            return .getCallDetails(id: id)
        case let .archiveCall(id):
            return .archiveCall(id: id)
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getDetails:
            return .get
        case .archiveCall:
            return .post
        }
    }

    var params: Any? {
        switch self {
        case .archiveCall:
            return ["is_archived":true]
        default:
            return nil
        }
    }
}
