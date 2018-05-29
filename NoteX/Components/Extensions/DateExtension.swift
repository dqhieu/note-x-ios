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
            return "Just now"
        }
        if timeInterval < 2 * 60 {
            return "A minute ago"
        }
        if timeInterval < 60 * 60 {
            return "\(Int(timeInterval / 60)) minutes ago"
        }
        if timeInterval < 2 * 60 * 60 {
            return "An hour ago"
        }
        if timeInterval < 24 * 60 * 60 {
            return "\(Int(timeInterval / (60 * 60))) hours ago"
        }
        if timeInterval < 2 * 24 * 60 * 60 {
            return "Yesterday"
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: self)
    }
    
}
