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
    
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    
    public func timeAgo() -> String {
        let timeInterval = Date().timeIntervalSince(self)
        if timeInterval < 60 {
            return LocalizedString.Just_Now
        }
        if timeInterval < 2 * 60 {
            return "\(Int(timeInterval / 60)) \(LocalizedString.Minute_Ago)"
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
        if timeInterval < 8 * 24 * 60 * 60, let weekDay = dayNumberOfWeek() {
            switch weekDay {
            case 1:
                return LocalizedString.Sunday
            case 2:
                return LocalizedString.Monday
            case 3:
                return LocalizedString.Tuesday
            case 4:
                return LocalizedString.Wednesday
            case 5:
                return LocalizedString.Thursday
            case 6:
                return LocalizedString.Friday
            case 7:
                return LocalizedString.Saturday
            default:
                break
            }
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
}
