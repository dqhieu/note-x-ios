//
//  AppComponents.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import Foundation

class AppComponents {
    
    fileprivate static var _dataManager: DataManager!
    
    public static var dataManager: DataManager {
        return _dataManager
    }
    
    static func initialize() {
        _dataManager = DataManager()
    }
}
