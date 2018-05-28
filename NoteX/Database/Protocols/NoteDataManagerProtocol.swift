//
//  NoteDataManagerProtocol.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

protocol NoteDataManagerProtocol {

    func addNote(_ note: Note)
    
    func updateNoteContentById(_ id: String, content: String)
    
    func getNoteById(_ id: String) -> Note?
    
    func getAllNotes() -> [Note]
    
    func getAllNotesBelongToNotebookId(_ notebookId: String) -> [Note]
    
    func deleteNoteById(_ id: String)
    
    func deleteAllNotesBelongToNotebookId(_ notebookId: String)
}
