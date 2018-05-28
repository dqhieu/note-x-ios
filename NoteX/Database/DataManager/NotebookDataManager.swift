//
//  NotebookDataManager.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class NotebookDataManager: DatabaseProtocol, NotebookDataManagerProtocol {
    
    typealias Value = Notebook
    
    func addNotebook(_ notebook: Notebook) {
        self.add(notebook)
    }
    
    func updateNotebookNameById(_ id: String, name: String) {
        guard let notebook = getNotebookById(id) else { return }
        self.update(notebook, properties: ["_name": name])
    }
    
    func getNotebookById(_ id: String) -> Notebook? {
        let predicate = NSPredicate(format: "_id = %@", id)
        return get(predicate).first
    }
    
    func getAllNotebooks() -> [Notebook] {
        return get()
    }
    
    func deleteNotebookById(_ id: String) {
        guard let notebook = getNotebookById(id) else { return }
        delete(notebook)
    }
}
