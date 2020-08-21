//
//  Verification.swift
//  swiftui-full-stack-login-page
//
//  Created by Huy D. on 8/21/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct Verification: View {
    
    @State var code: String = ""
    @State var showRegistration: Bool = false
    @Environment(\.presentationMode) var present
    
    var body: some View {
        ZStack {
            NavigationLink(destination: Registration(), isActive: self.$showRegistration) {
                Text("")
            }
            VStack {
                HStack(spacing: 5) {
                    Button(action: {
                        self.present.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .bold))
                            .foregroundColor(.blue)
                            .padding(.trailing, 10)
                    }
                    Text("Verification")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 25)
                HStack(spacing: 15) {
                    TextField("Enter Code", text: self.$code)
                        .keyboardType(.numberPad)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                }
                Button(action: {
                    self.showRegistration.toggle()
                }) {
                    Text("Confirm")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .opacity(self.code.isEmpty ? 0.35 : 1)
                .disabled(self.code.isEmpty ? true : false)
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
}
