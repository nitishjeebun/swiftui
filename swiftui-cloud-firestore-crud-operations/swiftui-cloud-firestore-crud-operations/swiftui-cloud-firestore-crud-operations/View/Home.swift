//
//  Home.swift
//  swiftui-cloud-firestore-crud-operations
//
//  Created by Huy D. on 9/10/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var HomeModel = HomeViewModel()
    @State var inputMessage: String = ""
    @State var docID: String = ""
    @State var updateMessage: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                List {
                    ForEach(self.HomeModel.messages) { message in
                        Text(message.msg)
                            .onTapGesture {
                                self.docID = message.id ?? ""
                                withAnimation {
                                    self.updateMessage.toggle()
                                }
                        }
                    }
                    .onDelete { (indexSet) in
                        indexSet.forEach { index in
                            self.HomeModel.deleteMessage(docID: index)
                        }
                    }
                }
                HStack(spacing: 15) {
                    TextField("Message", text: self.$inputMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        self.addMessage()
                    }) {
                        Text("Add")
                            .fontWeight(.bold)
                    }
                }
                .padding()
            }
            if self.updateMessage {
                UpdateMessage(homeModel: self.HomeModel,
                              docID: self.$docID,
                              dismiss: self.$updateMessage)
            }
        }
        .navigationBarTitle("Home")
        .navigationBarItems(trailing: EditButton())
        .onAppear {
            self.HomeModel.fetchAllMessage()
        }
    }
    
    private func addMessage() {
        let message = Message(msg: self.inputMessage, date: .init(date: Date()))
        self.HomeModel.addMessage(message: message) { (status) in
            
        }
        self.inputMessage = ""
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
