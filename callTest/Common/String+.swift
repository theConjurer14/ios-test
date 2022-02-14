//
//  String+.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import Foundation

extension String {
    func APIFormat() -> Date? {
        return DateFormatter.APIFormat.date(from: self)
    }
}
