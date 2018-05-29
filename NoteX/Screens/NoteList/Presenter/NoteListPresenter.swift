//
//  NoteListPresenter.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class NoteListPresenter: NoteListPresenterProtocol {
    
    weak var view: NoteListViewProtocol?
    var interactor: NoteListInteractorInputProtocol?
    var wireframe: NoteListWireframeProtocol?
    
    fileprivate var _notebookId = "notebook1" // Currently we are using only 1 notebook
    
    func viewDidLoad() {
        guard let notes = interactor?.getAllNotes() else { return }
        view?.updateNoteList(notes)
    }
    
    func didSelectNote(_ note: Note) {
        wireframe?.navigateToNoteDetailView(from: view, with: note)
    }
    
    func didTapTakeNote() {
        let note = Note(notebookId: _notebookId, content: "")
        wireframe?.navigateToNoteDetailView(from: view, with: note)
    }
    
    func didUpdateNoteWithId(_ id: String) {
        guard let note = interactor?.getNoteById(id) else { return }
        view?.updateNoteInList(note)
    }
    
}

extension NoteListPresenter: NoteListInteractorOutputProtocol {
    
}
