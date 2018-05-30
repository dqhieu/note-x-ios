//
//  NoteDetailPresenter.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class NoteDetailPresenter: NoteDetailPresenterProtocol {
    
    weak var view: NoteDetailViewProtocol?
    var interactor: NoteDetailInteractorInputProtocol?
    var wireframe: NoteDetailWireframeProtocol?
    
    fileprivate var _note: Note
    fileprivate var _newContent: String
    
    fileprivate var _pendingUpdateContentWorkItem: DispatchWorkItem?
    
    init(note: Note) {
        _note = note
        _newContent = note.content
    }
    
    func viewDidLoad() {
        if interactor?.getNoteById(_note.id) == nil {
            interactor?.addNote(_note)
        }
        view?.loadNote(_note)
    }
    
    func noteContentDidChange(_ content: String) {
        _newContent = content
        _pendingUpdateContentWorkItem?.cancel()
        let requestWorkItem = DispatchWorkItem { [weak self] in
            guard let `self` = self else { return }
            self.interactor?.updateNoteContentById(self._note.id, content: content)
            self.view?.delegate?.didUpdateNoteWithId(self._note.id)
        }
        _pendingUpdateContentWorkItem = requestWorkItem
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: requestWorkItem)
    }
    
    func didTapBack() {
        _pendingUpdateContentWorkItem?.cancel()
        
        if _newContent.isBlank() {
            didTapDeleteNote(isUndoEnabled: false)
        } else if _newContent != _note.content {
            interactor?.updateNoteContentById(_note.id, content: _newContent)
            view?.delegate?.didUpdateNoteWithId(_note.id)
        }
    }
    
    func didTapDeleteNote(isUndoEnabled: Bool) {
        _pendingUpdateContentWorkItem?.cancel()
        
        interactor?.updateNoteContentById(_note.id, content: _newContent)
        if let note = interactor?.getNoteById(_note.id) {
            _note = Note(value: note)
        }
        let undoEnabled = _newContent.isBlank() ? false : true
        view?.delegate?.willDeleteNote(_note, isUndoEnabled: undoEnabled)
        interactor?.deleteNoteById(_note.id)
        view?.dismiss(completion: nil)
    }
}

extension NoteDetailPresenter: NoteDetailInteractorOutputProtocol {
    
}
