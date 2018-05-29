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
    
    fileprivate var _lblTakeNote: UILabel = {
        let label = UILabel()
        label.text = "Take a note..."
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        clipsToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        backgroundColor = UIColor.white
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTap)))
        
        addSubview(_containerView)
        _containerView.addSubview(_lblTakeNote)
        
        setupLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        _containerView.pin.all()
        _lblTakeNote.pin.top(10).height(30).left(10).sizeToFit(.height)
    }
    
    @objc private func didTap() {
        delegate?.takeNoteViewDidTap()
    }
}
