//
//  BaseUIView.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class BaseUIView: UIView {

    public func setupLayouts() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayouts()
    }

}
