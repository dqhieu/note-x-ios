//
//  NoteDetailProtocol.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

protocol NoteDetailViewProtocol: BaseViewProtocol {
    
    var presenter: NoteDetailPresenterProtocol? { get set }
    
    var delegate: NoteDetailViewDelegate? { get set }
    
    func loadNote(_ note: Note)
    
}

protocol NoteDetailPresenterProtocol: class {
    
    var view: NoteDetailViewProtocol? { get set }
    
    func viewDidLoad()
    
    func noteContentDidChange(_ content: String)
    
    func didTapBack()
    
    func didTapDeleteNote()
}

protocol NoteDetailWireframeProtocol: class {
    
    static func createNoteDetailViewWithNote(_ note: Note) -> NoteDetailViewProtocol
    
}

protocol NoteDetailInteractorInputProtocol: class {
    
    var presenter: NoteDetailInteractorOutputProtocol? { get set }
    
    func getNoteById(_ id: String) -> Note?
    
    func addNote(_ note: Note)
    
    func updateNoteContentById(_ id: String, content: String)
    
    func deleteNoteById(_ id: String)
    
}

protocol NoteDetailInteractorOutputProtocol: class {
    
}
