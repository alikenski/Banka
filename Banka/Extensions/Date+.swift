//
//  Date+.swift
//  Banka
//
//  Created by Alisher Aidarkhan on 31.01.2023.
//

import Foundation

extension Date {
    func toDBString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru")
        formatter.dateFormat = "dd.MM.YYYY HH:mm"
        formatter.timeZone = .current
        print("###: Date", formatter.string(from: self))
        return formatter.string(from: self)
    }
}
