//
//  UpdateMessage.swift
//  swiftui-cloud-firestore-crud-operations
//
//  Created by Huy D. on 9/10/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct UpdateMessage: View {
    
    @ObservedObject var homeModel: HomeViewModel
    @State var inputMessage: String = ""
    @Binding var docID: String
    @Binding var dismiss: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text("Messae")
                .font(.title)
                .fontWeight(.bold)
            TextField("Message", text: self.$inputMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack(spacing: 15) {
                Button(action: {
                    self.homeModel.updateMessage(message: self.inputMessage, docID: self.docID) { (status) in
                        
                    }
                    self.dismiss.toggle()
                }) {
                    Text("Update")
                        .fontWeight(.bold)
                }
                Button(action: {
                    withAnimation {
                        self.dismiss.toggle()
                    }
                }) {
                    Text("Cancel")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(15)
        .padding(.horizontal, 15)
        .background(
            Color.white.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
            .onAppear {
                self.inputMessage = self.homeModel.getMessage(at: self.docID)
        }
    }
}


