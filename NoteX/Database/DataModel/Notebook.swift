//
//  Notebook.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

public class Notebook: Object {

    @objc dynamic fileprivate var _id:            String = ""
    @objc dynamic fileprivate var _name:          String = ""
    @objc dynamic fileprivate var _createdAt:     Date   = Date()
    
    public var id: String {
        return _id
    }
    
    public var name: String {
        return _name
    }
    
    public var createdAt: Date {
        return _createdAt
    }
    
    override open static func primaryKey() -> String? {
        return "_id"
    }
    
    required public init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    public init(name: String) {
        super.init()
        self._id = UUID().uuidString
        self._name = name
        self._createdAt = Date()
    }
    
    required public init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public override init(value: Any) {
        super.init(value: value)
    }
    
    required public init() {
        super.init()
    }
    
}
