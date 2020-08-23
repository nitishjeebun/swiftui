//
//  ProfileCreation.swift
//  swiftui-full-stack-login-page
//
//  Created by Huy D. on 8/22/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ProfileCreation: View {
    
    @Binding var images: [Data]
    @State var username: String = ""
    @State var age: String = ""
    @State var about: String = ""
    @Environment(\.presentationMode) var present
    
    var body: some View {
        ZStack {
            //              NavigationLink(destination: Registration(), isActive: self.$showRegistration) {
            //                  Text("")
            //              }
            VStack(spacing: 25) {
                HStack(spacing: 5) {
                    Button(action: {
                        self.present.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                    Text("About You")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 25)
                HStack(spacing: 15) {
                    TextField("Username", text: self.$username)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                    TextField("Age", text: self.$age)
                        .frame(width: 80)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                }
                MultilineTextField(text: self.$about)
                    .padding()
                    .background(Color("Color1"))
                    .cornerRadius(10)
                Button(action: {
                    //                      self.showRegistration.toggle()
                }) {
                    Text("Create")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .opacity(self.isFilled() ? 0.35 : 1)
                .disabled(self.isFilled() ? true : false)
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(
            Color("Color")
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.windows.first?.rootViewController?.view.endEditing(true)
            }
        )
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
    
    func isFilled() -> Bool {
        return self.username.isEmpty
            || self.age.isEmpty
            || self.about.isEmpty
            || self.about == "About You !!!"
    }
}


