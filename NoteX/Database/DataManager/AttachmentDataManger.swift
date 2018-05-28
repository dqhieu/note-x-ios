//
//  AttachmentDataManger.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class AttachmentDataManger: DatabaseProtocol, AttachmentDataMangerProtocol {
    
    typealias Value = Attachment
    
    func addAttachment(_ attachment: Attachment) {
        add(attachment)
    }
    
    func getAttachmentById(_ id: String) -> Attachment? {
        let predicate = NSPredicate(format: "_id = %@", id)
        return get(predicate).first
    }
    
    func getAllAttachments() -> [Attachment] {
        return get()
    }
    
    func getAllAttachmentsBelongToNoteId(_ id: String) -> [Attachment] {
        let predicate = NSPredicate(format: "_noteId = %@", id)
        return get(predicate)
    }
    
    func deleteAllAttachmentBelongToNoteId(_ id: String) {
        let attachments = getAllAttachmentsBelongToNoteId(id)
        delete(attachments)
    }
}
