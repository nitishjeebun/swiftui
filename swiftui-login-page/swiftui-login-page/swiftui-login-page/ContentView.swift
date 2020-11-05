//
//  ContentView.swift
//  swiftui-login-page
//
//  Created by Huy D. on 10/26/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.all)
            .statusBar(hidden: true)
    }
}

struct Home: View {
    
    @State var signUp: Bool = false
    @State var user: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    
    var body: some View {
        let bounds = UIScreen.main.bounds
        ZStack {
            ZStack {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    Color("Color")
                        .clipShape(CShape())
                    Path { path in
                        path.addArc(center: CGPoint(x: bounds.width - 120, y: bounds.height - 50),
                                    radius: 40,
                                    startAngle: .zero,
                                    endAngle: .init(degrees: 180),
                                    clockwise: true)
                    }
                    .fill(Color.white)
                    Button {
                        withAnimation(.easeIn) {
                            self.signUp = false
                        }
                    } label: {
                        Image(systemName: self.signUp ? "xmark" : "person.fill")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(Color("Color"))
                    }
                    .offset(x: -110, y: -50)
                    Button {
                        withAnimation {
                            self.signUp = true
                        }
                    } label: {
                        Image(systemName: self.signUp ? "person.badge.plus.fill" : "xmark")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .offset(x: -30, y: -40)
                }
                // Login View
                VStack(alignment: .leading, spacing: 25) {
                    Text("Login")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.white)
                    Text("Username")
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    VStack {
                        TextField("Username", text: $user)
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    VStack {
                        SecureField("Password", text: $password)
                        Divider()
                            .background(Color.white.opacity(0.5))
                    }
                    Spacer(minLength: 0)
                }
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 35)
                .padding()
                //Signup View
            }
            .offset(y: self.signUp ? -bounds.height + (bounds.height < 750 ? 100 : 130) : 0)
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
        .preferredColorScheme(self.signUp ? .light : .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// 8:42
