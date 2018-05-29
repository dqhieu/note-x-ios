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
    
}
