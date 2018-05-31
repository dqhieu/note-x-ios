//
//  StringExtension.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

extension String {
    
    func isBlank() -> Bool {
        let trimmed = self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return trimmed.isEmpty
    }
    
    func firstNonEmptyLine() -> String? {
        let allLines = components(separatedBy: "\n")
        for line in allLines {
            if !line.isBlank() {
                return line
            }
        }
        return nil
    }
    
    func removeFirstNonEmptyLine() -> String? {
        var allLines = components(separatedBy: "\n")
        while let first = allLines.first, first.isBlank() {
            allLines.removeFirst()
        }
        return allLines.dropFirst().joined(separator: " ")
    }
    
}
