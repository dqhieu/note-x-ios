//
//  NoteDataManager.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class NoteDataManager: DatabaseProtocol, NoteDataManagerProtocol {
    
    typealias Value = Note
    
    func addNote(_ note: Note) {
        add(note)
    }
    
    func updateNoteContentById(_ id: String, content: String) {
        guard let note = getNoteById(id) else { return }
        update(note, properties: ["_content": content, "_updatedAt": Date()])
    }
    
    func getNoteById(_ id: String) -> Note? {
        let predicate = NSPredicate(format: "_id = %@", id)
        return get(predicate).first
    }
    
    func getAllNotes() -> [Note] {
        return get()
    }
    
    func getAllNotesBelongToNotebookId(_ notebookId: String) -> [Note] {
        let predicate = NSPredicate(format: "_notebookId = %@", notebookId)
        return get(predicate)
    }
    
    func deleteNoteById(_ id: String) {
        guard let note = getNoteById(id) else { return }
        delete(note)
    }
    
    func deleteAllNotesBelongToNotebookId(_ notebookId: String) {
        let notes = getAllNotesBelongToNotebookId(notebookId)
        delete(notes)
    }
}
