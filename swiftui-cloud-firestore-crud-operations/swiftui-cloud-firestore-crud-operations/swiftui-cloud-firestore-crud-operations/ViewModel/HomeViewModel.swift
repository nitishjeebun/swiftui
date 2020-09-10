//
//  HomeViewModel.swift
//  swiftui-cloud-firestore-crud-operations
//
//  Created by Huy D. on 9/10/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class HomeViewModel: ObservableObject {
    
    @Published var messages: [Message] = []
    let ref = Firestore.firestore()
    
    func fetchAllMessage() {
        ref.collection("Messages").order(by: "date", descending: false).addSnapshotListener { (snapshot, error) in
            guard let docs = snapshot else { return }
            docs.documentChanges.forEach { (doc) in
                if let message = try? doc.document.data(as: Message.self) {
                    if doc.type == .added {
                        self.messages.append(message)
                    }
                    if doc.type == .modified {
                        for (i, v) in self.messages.enumerated() {
                            if v.id == message.id {
                                self.messages[i] = message
                            }
                        }
                    }
                } else {
                    print("Error parsing message!")
                }
            }
        }
    }
    
    func addMessage(message: Message, completion: @escaping (Bool) -> ()) {
        do {
            let _ = try ref.collection("Messages").addDocument(from: message, completion: { (error) in
                guard error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            })
        } catch {
            print(error.localizedDescription)
            completion(false)
        }
    }
    
    func deleteMessage(docID: Int) {
        guard let id = messages[docID].id else { return }
        ref.collection("Messages").document(id).delete { (error) in
            guard error == nil else { return }
            self.messages.remove(at: docID)
        }
    }
    
    func updateMessage(message: String, docID: String, completion: @escaping (Bool) -> ()) {
        ref.collection("Messages").document(docID).updateData(["message": message]) { (error) in
            guard error == nil else {
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func getMessage(at docID: String) -> String {
        guard let message = messages.first(where: { (message) -> Bool in
            message.id == docID
        }) else {
            return ""
        }
        return message.msg
    }
    
}
