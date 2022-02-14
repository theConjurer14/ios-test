//
//  Call.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation

struct Call: Decodable, Identifiable {
    let id: Int
    let createdAt: Date
    let from: String
    let direction: CallDirection
    let to: String?
    let via, duration: String
    let isArchived: Bool
    let callType: CallType
    
    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case direction, from, to, via, duration
        case isArchived = "is_archived"
        case callType = "call_type"
    }
    
    enum CallDirection: String, Decodable {
        case inbound
        case outbound
    }
    enum CallType: String, Decodable {
        case missed
        case answered
        case voicemail
    }
}

struct ResetCalls: Decodable {
    let message: String
}

