//
//  NotebookDataManagerProtocol.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

protocol NotebookDataManagerProtocol {

    func addNotebook(_ notebook: Notebook)
    
    func updateNotebookNameById(_ id: String, name: String)
    
    func getNotebookById(_ id: String) -> Notebook?
    
    func getAllNotebooks() -> [Notebook]
    
    func deleteNotebookById(_ id: String)
}
