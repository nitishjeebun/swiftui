//
//  Message.swift
//  swiftui-scroll-reader
//
//  Created by Huy D. on 9/28/20.
//

import Foundation

struct Message: Identifiable, Equatable {
    var id: Date
    var message: String
    var isMyMessage: Bool
    var profilePic: String
    var photo: Data?
}

class Messages: ObservableObject {
    
    @Published var messages: [Message] = []
    
    init() {
        let strings = ["Hii","Hello !!!!",
                       "What's Up, What Are You Doing ???",
                       "Nothing Just Simply Enjoying Quarintine Holidays..You???",
                       "Same :))",
                       "Ohhhhh",
                       "What About Your Country ???",
                       "Very Very Bad...",
                       "Ok Be Safe",
                       "Bye....",
                       "Ok...."]
        for (i, v) in strings.enumerated() {
            let newMessage = Message(id: Date(),
                                     message: v,
                                     isMyMessage: i % 2 == 0,
                                     profilePic: i % 2 == 0 ? "p1" : "p2")
            messages.append(newMessage)
        }
    }
    
    func writeMessage(id: Date, message: String, isMyMessage: Bool, profilePic: String, photo: Data?) {
        let newMessage = Message(id: id,
                                 message: message,
                                 isMyMessage: isMyMessage,
                                 profilePic: profilePic,
                                 photo: photo)
        messages.append(newMessage)
    }
    
}
