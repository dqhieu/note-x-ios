//
//  Note.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

public class Note: Object {

    @objc dynamic fileprivate var _id:            String = ""
    @objc dynamic fileprivate var _notebookId:    String = ""
    @objc dynamic fileprivate var _content:       String = ""
    @objc dynamic fileprivate var _createdAt:     Date   = Date()
    @objc dynamic fileprivate var _updatedAt:     Date   = Date()
    
    public var id: String {
        return _id
    }
    
    public var notebookId: String {
        return _notebookId
    }
    
    public var content: String {
        return _content
    }
    
    public var createdAt: Date {
        return _createdAt
    }
    
    public var updatedAt: Date {
        return _updatedAt
    }
    
    override open static func primaryKey() -> String? {
        return "_id"
    }
    
    public init(notebookId: String, content: String) {
        self._id = UUID().uuidString
        self._notebookId = notebookId
        self._content = content
        self._createdAt = Date()
        self._updatedAt = Date()
        super.init()
    }
    
    required public init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required public init() {
        super.init()
    }
    
    public override init(value: Any) {
        super.init(value: value)
    }
    
    required public init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public func getTitle() -> String? {
        return _content.firstNonEmptyLine()
    }
    
    public func getOverview() -> String? {
        guard let overview = _content.removeFirstNonEmptyLine() else { return LocalizedString.No_Additional_Text }
        if overview.isBlank() {
            return LocalizedString.No_Additional_Text
        }
        return overview
    }
    
}
