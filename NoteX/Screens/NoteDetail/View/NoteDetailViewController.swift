//
//  NoteDetailViewController.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class NoteDetailViewController: BaseUIViewController, NoteDetailViewProtocol {
    
    var presenter: NoteDetailPresenterProtocol?
    
    weak var delegate: NoteDetailViewDelegate?
    
    fileprivate var _txtContent: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 20)
        return textView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< \(LocalizedString.Back)", style: UIBarButtonItemStyle.plain, target: self, action: #selector(didTapBack))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: LocalizedString.Delete, style: UIBarButtonItemStyle.plain, target: self, action: #selector(didTapDeleteNote))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func setupViews() {
        super.setupViews()
        view.addSubview(_txtContent)
    }
    
    override func setupSelectors() {
        super.setupSelectors()
        _txtContent.delegate = self
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _txtContent.pin.all()
    }
    
    func loadNote(_ note: Note) {
        self.title = note.updatedAt.ddMMMyyyyHHmm()
        _txtContent.text = note.content
        if note.content == "" {
            _txtContent.becomeFirstResponder()
        }
    }
    
    override func onKeyboardWillShow(notification: NSNotification) {
        super.onKeyboardWillShow(notification: notification)
        
        guard let userInfo = notification.userInfo,
            let keyboardFrame: NSValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue else { return }
        let _keyboardHeight = keyboardFrame.cgRectValue.height
        _txtContent.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: _keyboardHeight, right: 0)
    }
    
    override func onKeyboardWillHide() {
        super.onKeyboardWillHide()
        _txtContent.contentInset = UIEdgeInsets()
    }
    
    override func didTapBack() {
        presenter?.didTapBack()
        super.didTapBack()
    }
    
    @objc func didTapDeleteNote() {
        presenter?.didTapDeleteNote(isUndoEnabled: true)
    }
}

extension NoteDetailViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        presenter?.noteContentDidChange(textView.text)
    }
    
}
