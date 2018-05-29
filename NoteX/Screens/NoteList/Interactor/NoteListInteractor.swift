//
//  NoteListInteractor.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

class NoteListInteractor: NoteListInteractorInputProtocol {
    
    weak var presenter: NoteListInteractorOutputProtocol?
    
    fileprivate var _dataManager: DataManager
    
    init(dataManager: DataManager) {
        _dataManager = dataManager
    }
    
    func getAllNotes() -> [Note] {
        return _dataManager.getAllNotes()
    }
    
    func getNoteById(_ id: String) -> Note? {
        return _dataManager.getNoteById(id)
    }
    
}
