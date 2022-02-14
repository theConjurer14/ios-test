//
//  MockData.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation

extension Call {
    static let callListMock = [
        Call(id: 7834,
             createdAt: "2018-04-19T09:38:41.000Z".APIFormat() ?? Date(),
             from: "Pierre-Baptiste Béchu",
             direction: .outbound,
             to: "06 46 62 12 33",
             via: "NYC Office",
             duration: "120",
             isArchived: false,
             callType: .missed),
        Call(id: 7833,
             createdAt: "2018-04-18T16:59:48.000Z".APIFormat() ?? Date(),
             from: "Jonathan Anguelov",
             direction: .outbound,
             to: "06 45 13 53 91",
             via: "NYC Office",
             duration: "60",
             isArchived: false,
             callType: .missed),
        Call(id: 7832,
             createdAt: "2018-04-18T16:53:22.000Z".APIFormat() ?? Date(),
             from: "06 19 18 23 92",
             direction: .inbound,
             to: "Jonathan Anguelov",
             via: "Support FR",
             duration: "180",
             isArchived: false,
             callType: .answered),
        Call(id: 7831,
             createdAt: "2018-04-18T16:42:55.000Z".APIFormat() ?? Date(),
             from: "06 34 45 74 34",
             direction: .inbound,
             to: "Xavier Durand",
             via: "Support FR",
             duration: "180",
             isArchived: true,
             callType: .answered)
    ]

    static let callMock = Call(id: 7834,
                                createdAt: "2018-04-19T09:38:41.000Z".APIFormat() ?? Date(),
                                from: "Pierre-Baptiste Béchu",
                                direction: .outbound,
                                to: "06 46 62 12 33",
                                via: "NYC Office",
                                duration: "120",
                                isArchived: false,
                                callType: .missed)
    
    static let emptyCallMock = Call(id: 0,
                                createdAt: Date(),
                                from: "",
                                direction: .outbound,
                                to: "",
                                via: "",
                                duration: "",
                                isArchived: false,
                                callType: .missed)
}

extension ResetCalls {
    static let mock = ResetCalls(message: "done")
}
