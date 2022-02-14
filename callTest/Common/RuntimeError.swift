//
//  RuntimeError.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import Foundation

struct RuntimeError: Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }

    public var localizedDescription: String {
        return message
    }
}
