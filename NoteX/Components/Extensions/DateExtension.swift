//
//  DateExtension.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

public extension Date {
    
    public func ddMMMyyyy() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    public func ddMMMyyyyHHmm() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy HH:mm"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
    public func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
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
            return "\(Int(timeInterval / (60 * 60))) \(LocalizedString.Hour_Ago)"
        }
        if timeInterval < 24 * 60 * 60 {
            return "\(Int(timeInterval / (60 * 60))) \(LocalizedString.Hours_Ago)"
        }
        if timeInterval < 2 * 24 * 60 * 60 {
            return LocalizedString.Yesterday
        }
        if timeInterval < 8 * 24 * 60 * 60 {
            switch dayOfWeek() {
            case "Sunday":
                return LocalizedString.Sunday
            case "Monday":
                return LocalizedString.Monday
            case "Tuesday":
                return LocalizedString.Tuesday
            case "Wednesday":
                return LocalizedString.Wednesday
            case "Thursday":
                return LocalizedString.Thursday
            case "Friday":
                return LocalizedString.Friday
            case "Saturday":
                return LocalizedString.Saturday
            default:
                break
            }
        }
        
        return ddMMMyyyy()
    }
    
}
