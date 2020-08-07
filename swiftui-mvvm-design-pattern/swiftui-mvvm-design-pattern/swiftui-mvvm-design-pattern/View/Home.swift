//
//  Home.swift
//  swiftui-mvvm-design-pattern
//
//  Created by Huy D. on 8/6/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct Home: View {
    
    @ObservedObject var users = FectchAccounts()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
        .onAppear {
            self.users.fetchUsers()
        }
        .navigationBarTitle("Home")
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
