//
//  NoteDetailInteractor.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class NoteDetailInteractor: NoteDetailInteractorInputProtocol {
    
    weak var presenter: NoteDetailInteractorOutputProtocol?
    
    fileprivate var _dataManager: DataManager
    
    init(dataManager: DataManager) {
        _dataManager = dataManager
    }
    
    func getNoteById(_ id: String) -> Note? {
        return _dataManager.getNoteById(id)
    }
    
    func addNote(_ note: Note) {
        _dataManager.addNote(note)
    }
    
    func updateNoteContentById(_ id: String, content: String) {
        _dataManager.updateNoteContentById(id, content: content)
    }
    
    func deleteNoteById(_ id: String) {
        _dataManager.deleteNoteById(id)
    }
    
}
