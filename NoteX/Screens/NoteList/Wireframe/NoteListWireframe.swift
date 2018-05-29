//
//  NoteListWireframe.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class NoteListWireframe: NoteListWireframeProtocol {
    
    static func createNoteListView() -> NoteListViewProtocol {
        let view = NoteListViewController()
        let presenter = NoteListPresenter()
        let interactor = NoteListInteractor(dataManager: AppComponents.dataManager)
        let wireframe = NoteListWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToNoteDetailView(from view: NoteListViewProtocol?, with note: Note) {
        guard let noteDetailView = NoteDetailWireframe.createNoteDetailViewWithNote(note) as? NoteDetailViewController, let view = view as? NoteListViewController else { return }
        noteDetailView.delegate = view
        view.navigationController?.pushViewController(noteDetailView, animated: true)
    }

}
