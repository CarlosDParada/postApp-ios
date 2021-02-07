//
//  StringExtension.swift
//  Domain
//
//  Created by Carlos Parada on 7/02/21.
//

import Foundation

extension String {
    public func parseDateTh() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat =  FormatDate.inputPost
        let dataShort = String(self.dropLast(25))
        if let date = dateFormatter.date(from: dataShort) {
            let dateFormatter2 = DateFormatter()
            dateFormatter2.dateFormat = date.dateFormatWithSuffix()
            return dateFormatter2.string(from: date)
        }
        return dateFormatter.string(from: Date())
    }
}
