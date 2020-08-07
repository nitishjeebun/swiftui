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
        ZStack {
            if self.users.accounts.isEmpty {
                Indicator()
            } else {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(self.users.accounts) { user in
                            CardView(account: user)
                        }
                    }
                }
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
