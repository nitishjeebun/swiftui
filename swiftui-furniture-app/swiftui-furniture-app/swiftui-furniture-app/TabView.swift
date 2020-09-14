//
//  TabView.swift
//  swiftui-furniture-app
//
//  Created by Huy D. on 9/14/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct TabView: View {
    
    @State var index: Int = 0
    @Environment(\.colorScheme) var scheme
    
    private let safeAreaInsetBottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HomeView()
                    .opacity(self.index == 0 ? 1 : 0)
                Search()
                    .opacity(self.index == 1 ? 1 : 0)
                Cart()
                    .opacity(self.index == 2 ? 1 : 0)
                Account()
                    .opacity(self.index == 3 ? 1 : 0)
            }
            HStack {
                // Home
                Button(action: {
                    self.index = 0
                }) {
                    HStack(spacing: 6) {
                        Image("home")
                            .foregroundColor(self.index == 0 ? . white : .primary)
                        if self.index == 0 {
                            Text("Home")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 0 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                Spacer(minLength: 0)
                // Search
                Button(action: {
                    self.index = 1
                }) {
                    HStack(spacing: 6) {
                        Image("search")
                            .foregroundColor(self.index == 1 ? . white : .primary)
                        if self.index == 1 {
                            Text("Search")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 1 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                Spacer(minLength: 0)
                // Cart
                Button(action: {
                    self.index = 2
                }) {
                    HStack(spacing: 6) {
                        Image("cart")
                            .foregroundColor(self.index == 2 ? . white : .primary)
                        if self.index == 2 {
                            Text("Cart")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 2 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
                Spacer(minLength: 0)
                // Account
                Button(action: {
                    self.index = 3
                }) {
                    HStack(spacing: 6) {
                        Image("account")
                            .foregroundColor(self.index == 3 ? . white : .primary)
                        if self.index == 3 {
                            Text("Account")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(self.index == 3 ? Color("Color") : Color.clear)
                    .clipShape(Capsule())
                }
            }
            .padding(.top)
            .padding(.horizontal, 25)
            .padding(.bottom, safeAreaInsetBottom == 0 ? 10 : safeAreaInsetBottom)
            .background(self.scheme == .dark ? Color.black : Color.white)
            .shadow(color: Color.primary.opacity(0.08), radius: 5, x: 5, y: -5)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
}


