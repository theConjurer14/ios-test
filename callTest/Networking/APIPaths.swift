//
//  APIPaths.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation

enum APIPaths {
    case getCallList
    case getCallDetails(id: Int)
    case archiveCall(id: Int)
    case resetCallList
    
    var rawValue: String {
        switch self {
        case .getCallList:
            return "/activities"
        case let .getCallDetails(id):
            return "/activities/\(id)"
        case let .archiveCall(id):
            return "/activities/\(id)"
        case .resetCallList:
            return "/reset"
        }
    }
}
