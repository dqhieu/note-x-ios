//
//  Attachment.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

public enum AttachmentType: String {
    case image
    case video
    case file
    case undefined
}

public class Attachment: Object {

    @objc dynamic fileprivate var _id:          String = ""
    @objc dynamic fileprivate var _noteId:      String = ""
    @objc dynamic fileprivate var _type:        String?
    @objc dynamic fileprivate var _description: String = ""
    @objc dynamic fileprivate var _resourceId:  String?
    @objc dynamic fileprivate var _createdAt:   Date?
    
    public var id: String {
        return _id
    }
    
    public var noteId: String {
        return _noteId
    }
    
    public var type: AttachmentType? {
        return AttachmentType(rawValue: _type ?? "undefined")
    }
    
    public var descriptionString: String {
        return _description
    }
    
    public var resourceId: String? {
        return _resourceId
    }
    
    public var createdAt: Date? {
        return _createdAt
    }
    
    override open static func primaryKey() -> String? {
        return "_id"
    }
    
    public init(noteId: String, description: String, type: AttachmentType?) {
        self._id = UUID().uuidString
        self._noteId = noteId
        self._description = description
        self._type = type?.rawValue
        self._createdAt = Date()
        super.init()
    }
    
    required public init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required public init() {
        super.init()
    }
    
    required public init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
