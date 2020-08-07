//
//  Account.swift
//  swiftui-mvvm-design-pattern
//
//  Created by Huy D. on 8/6/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import Foundation

struct Account: Identifiable, Decodable {
    var id: Int
    var login: String
    var avatar_url: String
}
