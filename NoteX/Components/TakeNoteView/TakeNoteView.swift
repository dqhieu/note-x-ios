//
//  TakeNoteView.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class TakeNoteView: BaseUIView {

    weak var delegate: TakeNoteViewDelegate?
    
    fileprivate var _containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate var _btnTakeNote: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Take a note...", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        backgroundColor = UIColor.white
        
        addSubview(_containerView)
        _containerView.addSubview(_btnTakeNote)
        _btnTakeNote.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        setupLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _containerView.pin.all()
        _btnTakeNote.pin.top(10).height(30).left(10).sizeToFit(.height)
    }
    
    @objc private func didTapButton() {
        delegate?.takeNoteViewDidTap()
    }
}
