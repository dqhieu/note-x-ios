//
//  AttachmentDataMangerProtocol.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/25/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

protocol AttachmentDataMangerProtocol {

    func addAttachment(_ attachment: Attachment)
    
    func getAttachmentById(_ id: String) -> Attachment?
    
    func getAllAttachments() -> [Attachment]
    
    func getAllAttachmentsBelongToNoteId(_ id: String) -> [Attachment]
    
    func deleteAllAttachmentBelongToNoteId(_ id: String)
}
