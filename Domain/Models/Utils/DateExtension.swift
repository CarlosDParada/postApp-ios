//
//  DateExtension.swift
//  Domain
//
//  Created by Carlos Parada on 7/02/21.
//

import Foundation

public struct FormatDate {
    // "Tue Jan 11 2022 16:34:43 GMT-0500 "
    // Colombia Standard Time) <- No work with (z)
    /// Input de la fecha recortada la seccion (z) no estaba funcionando
    public static let inputPost      = "E MMM dd yyyy HH:mm:ss 'GMT'Z"
}

extension Date {

    /// Encargado de colocar el sufijo de acuerdo al dia
    /// - Returns: String de la fecha parseada
    public func dateFormatWithSuffix() -> String {
        return "MMM dd'\(self.daySuffix())'"
    }

    func daySuffix() -> String {
        let calendar = Calendar.current
        let components = (calendar as NSCalendar).components(.day, from: self)
        let dayOfMonth = components.day
        switch dayOfMonth {
        case 1, 21, 31:
            return "st"
        case 2, 22:
            return "nd"
        case 3, 23:
            return "rd"
        default:
            return "th"
        }
    }
}
