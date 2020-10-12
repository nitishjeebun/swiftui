//
//  ContentView.swift
//  swiftui-firebase-connection
//
//  Created by Huy D. on 10/10/20.
//

import SwiftUI
import GoogleSignIn

struct ContentView: View {
    
    @ObservedObject var info: AppDelegate
    
    var body: some View {
        VStack {
            Button {
                GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
                GIDSignIn.sharedInstance()?.signIn()
            } label: {
                Text("Sign In")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 45)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
            Text(info.email)
                .padding(.top, 25)
        }
    }
}


