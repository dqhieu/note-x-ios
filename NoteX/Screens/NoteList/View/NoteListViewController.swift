//
//  NoteListViewController.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialSnackbar

class NoteListViewController: BaseUIViewController, NoteListViewProtocol {
    
    var presenter: NoteListPresenterProtocol?
    
    fileprivate var _notes = [Note]()
    
    fileprivate var _noteTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = UIColor.lightGray
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reusableIdentifier)
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        return tableView
    }()
    
    fileprivate var _takeNoteView: TakeNoteView = {
        let view = TakeNoteView()
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Notes"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MDCSnackbarManager.dismissAndCallCompletionBlocks(withCategory: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(_noteTableView)
        view.addSubview(_takeNoteView)
    }
    
    override func setupSelectors() {
        super.setupSelectors()
        _takeNoteView.delegate = self
        _noteTableView.delegate = self
        _noteTableView.dataSource = self
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _takeNoteView.pin.bottom().horizontally().height(50 + view.pin.safeArea.bottom)
        _noteTableView.pin.above(of: _takeNoteView).horizontally().top()
    }
    
    func updateNoteList(_ notes: [Note]) {
        _notes = notes.sorted(by: { $0.updatedAt > $1.updatedAt })
        _noteTableView.reloadData()
        _noteTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .bottom, animated: true)
    }
    
    func updateNoteInList(_ note: Note) {
        _notes = _notes.filter({ $0.id != note.id })
        _notes.append(note)
        updateNoteList(_notes)
    }
    
    func showMessageDeletedNote(_ note: Note) {
        var title = note.getTitle() ?? ""
        if title.count > 50 {
            title = title.prefix(50) + "..."
        }
        let message = MDCSnackbarMessage()
        message.text = "Deleted \(title)"
        let action = MDCSnackbarMessageAction()
        action.handler = {
            self.presenter?.didTapUndoDeleteNote(note)
        }
        action.title = "Undo"
        message.action = action
        MDCSnackbarManager.setBottomOffset(50 + view.pin.safeArea.bottom)
        MDCSnackbarManager.show(message)
    }
    
}

extension NoteListViewController: TakeNoteViewDelegate {
    
    func takeNoteViewDidTap() {
        presenter?.didTapTakeNote()
    }
    
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reusableIdentifier, for: indexPath) as? NoteCell else { return UITableViewCell() }
        cell.setup(note: _notes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.didSelectNote(_notes[indexPath.row])
    }
}

extension NoteListViewController: NoteDetailViewDelegate {
    
    func willDeleteNote(_ note: Note) {
        _notes = _notes.filter({ $0.id != note.id })
        _noteTableView.reloadData()
        showMessageDeletedNote(note)
    }
    
    func didUpdateNoteWithId(_ id: String) {
        presenter?.didUpdateNoteWithId(id)
    }
    
}
