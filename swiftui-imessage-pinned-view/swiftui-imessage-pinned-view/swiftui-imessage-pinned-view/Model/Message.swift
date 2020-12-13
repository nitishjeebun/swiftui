//
//  Message.swift
//  swiftui-imessage-pinned-view
//
//  Created by Huy D. on 12/13/20.
//

import SwiftUI

struct Message: Identifiable {
    var id: Int
    var name: String
    var message: String
    var profile: String
    var offset: CGFloat
}
