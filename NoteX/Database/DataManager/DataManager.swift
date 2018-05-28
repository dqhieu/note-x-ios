//
//  DataManager.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/28/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class DataManager: NoteDataManagerProtocol, NotebookDataManagerProtocol, AttachmentDataMangerProtocol {
    
    fileprivate let _noteDataManager = NoteDataManager()
    fileprivate let _notebookDataManager = NotebookDataManager()
    fileprivate let _attachmentDataManager = AttachmentDataManger()
    
    // Note data manager
    func addNote(_ note: Note) {
        _noteDataManager.addNote(note)
    }
    
    func updateNoteContentById(_ id: String, content: String) {
        _noteDataManager.updateNoteContentById(id, content: content)
    }
    
    func getNoteById(_ id: String) -> Note? {
        return _noteDataManager.getNoteById(id)
    }
    
    func getAllNotes() -> [Note] {
        return _noteDataManager.getAllNotes()
    }
    
    func getAllNotesBelongToNotebookId(_ notebookId: String) -> [Note] {
        return _noteDataManager.getAllNotesBelongToNotebookId(notebookId)
    }
    
    func deleteNoteById(_ id: String) {
        _noteDataManager.deleteNoteById(id)
    }
    
    func deleteAllNotesBelongToNotebookId(_ notebookId: String) {
        _noteDataManager.deleteAllNotesBelongToNotebookId(notebookId)
    }
    
    // Notebook data manager
    func addNotebook(_ notebook: Notebook) {
        _notebookDataManager.addNotebook(notebook)
    }
    
    func updateNotebookNameById(_ id: String, name: String) {
        _notebookDataManager.updateNotebookNameById(id, name: name)
    }
    
    func getNotebookById(_ id: String) -> Notebook? {
        return _notebookDataManager.getNotebookById(id)
    }
    
    func getAllNotebooks() -> [Notebook] {
        return _notebookDataManager.getAllNotebooks()
    }
    
    func deleteNotebookById(_ id: String) {
        _notebookDataManager.deleteNotebookById(id)
    }
    
    // Attachment data manager
    func addAttachment(_ attachment: Attachment) {
        _attachmentDataManager.addAttachment(attachment)
    }
    
    func getAttachmentById(_ id: String) -> Attachment? {
        return _attachmentDataManager.getAttachmentById(id)
    }
    
    func getAllAttachments() -> [Attachment] {
        return _attachmentDataManager.getAllAttachments()
    }
    
    func getAllAttachmentsBelongToNoteId(_ id: String) -> [Attachment] {
        return _attachmentDataManager.getAllAttachmentsBelongToNoteId(id)
    }
    
    func deleteAllAttachmentBelongToNoteId(_ id: String) {
        _attachmentDataManager.deleteAllAttachmentBelongToNoteId(id)
    }
    
}
