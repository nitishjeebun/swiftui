//
//  Message.swift
//  swiftui-cloud-firestore-crud-operations
//
//  Created by Huy D. on 9/10/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable {
    
    @DocumentID var id: String?
    var msg: String
    var date: Timestamp
    
    enum CodingKeys: String, CodingKey {
        case id
        case msg = "message"
        case date
    }
    
}
