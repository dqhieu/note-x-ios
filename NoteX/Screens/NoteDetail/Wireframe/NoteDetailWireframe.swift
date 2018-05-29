//
//  NoteDetailWireframe.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class NoteDetailWireframe: NoteDetailWireframeProtocol {
    
    static func createNoteDetailViewWithNote(_ note: Note) -> NoteDetailViewProtocol {
        let view = NoteDetailViewController()
        let presenter = NoteDetailPresenter(note: note)
        let interactor = NoteDetailInteractor(dataManager: AppComponents.dataManager)
        let wireframe = NoteDetailWireframe()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireframe = wireframe
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}
