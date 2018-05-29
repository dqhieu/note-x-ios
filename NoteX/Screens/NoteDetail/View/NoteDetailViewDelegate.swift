//
//  NoteDetailViewDelegate.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

protocol NoteDetailViewDelegate: class {
    
    func willDeleteNote(_ note: Note, isUndoEnabled: Bool)
    
    func didUpdateNoteWithId(_ id: String)
    
}
