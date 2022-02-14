//
//  Date+.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import Foundation
enum CustomDateStyle: String {
    case APIFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    case listView = "MMM. dd \n HH:mm"
    case detailsView = "dd/MM/yy HH:mm"
}

extension Date {
    static let dateFormatter: DateFormatter = DateFormatter()
    
    func toString(style: CustomDateStyle) -> String {
        let formatter = Date.dateFormatter
        formatter.timeZone = Calendar.current.timeZone
        formatter.dateFormat = style.rawValue
        return formatter.string(from: self)
    }
}

extension DateFormatter {
    static let APIFormat: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = CustomDateStyle.APIFormat.rawValue
        formatter.calendar = Calendar(identifier: .iso8601)
      formatter.timeZone = Calendar.current.timeZone
      formatter.locale = Calendar.current.locale
      return formatter
    }()
}
