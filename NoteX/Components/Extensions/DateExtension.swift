//
//  DateExtension.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

public extension Date {
    
    public func toStringShortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    public func toStringDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    public func timeAgo() -> String {
        let timeInterval = Date().timeIntervalSince(self)
        if timeInterval < 60 {
            return LocalizedString.Just_Now
        }
        if timeInterval < 2 * 60 {
            return LocalizedString.A_Minute_Ago
        }
        if timeInterval < 60 * 60 {
            return "\(Int(timeInterval / 60)) \(LocalizedString.Minutes_Ago)"
        }
        if timeInterval < 2 * 60 * 60 {
            return LocalizedString.An_Hour_Ago
        }
        if timeInterval < 24 * 60 * 60 {
            return "\(Int(timeInterval / (60 * 60))) \(LocalizedString.Hours_Ago)"
        }
        if timeInterval < 2 * 24 * 60 * 60 {
            return LocalizedString.Yesterday
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
}
