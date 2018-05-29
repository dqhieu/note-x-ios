//
//  NoteCell.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit
import PinLayout

class NoteCell: UITableViewCell {

    static let reusableIdentifier = "NoteCellIdentifier"
    
    fileprivate var _lblTitle: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate var _lblCreated: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate var _lblOverview: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    fileprivate var _containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        _containerView.backgroundColor = UIColor.white
        selectionStyle = .none
        contentView.backgroundColor = UIColor.lightGray
        
        contentView.addSubview(_containerView)
        _containerView.addSubview(_lblTitle)
        _containerView.addSubview(_lblCreated)
        _containerView.addSubview(_lblOverview)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
        _containerView.pin.top(10).horizontally(10).height(60)
        _lblTitle.pin.top(5).horizontally(10).height(30)
        _lblCreated.pin.below(of: _lblTitle, aligned: .left).height(20).sizeToFit(.height)
        _lblOverview.pin.after(of: _lblCreated, aligned: .bottom).marginLeft(10).right().height(20)
    }
    
    private func setupShadow() {
        let shadowSize : CGFloat = 4.0
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: _containerView.frame.size.width + shadowSize,
                                                   height: _containerView.frame.size.height + shadowSize))
        _containerView.layer.masksToBounds = false
        _containerView.layer.shadowColor = UIColor.black.cgColor
        _containerView.layer.shadowOffset = CGSize(width: 0, height: 0.0)
        _containerView.layer.shadowOpacity = 0.5
        _containerView.layer.cornerRadius = 5
        _containerView.layer.shadowPath = shadowPath.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayouts()
        setupShadow()
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        setupLayouts()
        return CGSize(width: contentView.frame.width, height: self._containerView.frame.maxY)
    }
    
    func setup(note: Note) {
        _lblTitle.text = note.getTitle()
        _lblCreated.text = note.createdAt.toStringShortDate()
        _lblOverview.text = note.getOverview()
    }
}
