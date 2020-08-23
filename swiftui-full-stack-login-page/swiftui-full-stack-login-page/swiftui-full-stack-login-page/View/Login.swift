//
//  Login.swift
//  swiftui-full-stack-login-page
//
//  Created by Huy D. on 8/21/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct Login: View {
    
    @State var countryCode: String = ""
    @State var number: String = ""
    @State var showVerification: Bool = false
    
    var body: some View {
        ZStack {
            NavigationLink(destination: Verification(), isActive: self.$showVerification) {
                Text("")
            }
            VStack(spacing: 35) {
                HStack {
                    Text("Login")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 25)
                HStack(spacing: 15) {
                    TextField("1", text: self.$countryCode)
                        .keyboardType(.numberPad)
                        .frame(width: 50)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                    TextField("Mobile Number", text: self.$number)
                        .keyboardType(.numberPad)
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(Color("Color1"))
                        .clipShape(Capsule())
                }
                Button(action: {
                    self.showVerification.toggle()
                }) {
                    Text("Verify")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 40)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
                .padding(.top, 25)
                .opacity((self.countryCode.isEmpty || self.number.isEmpty) ? 0.35 : 1)
                .disabled((self.countryCode.isEmpty || self.number.isEmpty) ? true : false)
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



