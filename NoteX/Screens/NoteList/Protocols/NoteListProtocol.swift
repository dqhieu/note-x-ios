//
//  NoteListProtocol.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

protocol NoteListViewProtocol: BaseViewProtocol {
    
    var presenter: NoteListPresenterProtocol? { get set }
    
    func updateNoteList(_ notes: [Note])
    
    func updateNoteInList(_ note: Note)
    
}

protocol NoteListPresenterProtocol: class {
    
    var view: NoteListViewProtocol? { get set }
    
    func viewDidLoad()
 
    func didSelectNote(_ note: Note)
    
    func didTapTakeNote()
    
    func didUpdateNoteWithId(_ id: String)
}

protocol NoteListWireframeProtocol: class {
    
    static func createNoteListView() -> NoteListViewProtocol
    
    func navigateToNoteDetailView(from view: NoteListViewProtocol?, with note: Note)
    
}

protocol NoteListInteractorInputProtocol: class {
    
    var presenter: NoteListInteractorOutputProtocol? { get set }
    
    func getAllNotes() -> [Note]
    
    func getNoteById(_ id: String) -> Note?
}

protocol NoteListInteractorOutputProtocol: class {
    
    
    
}
