//
//  CardView.swift
//  swiftui-mvvm-design-pattern
//
//  Created by Huy D. on 8/6/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CardView: View {
    
    var account: Account
    
    var body: some View {
        HStack(spacing: 15) {
            AnimatedImage(url: URL(string: self.account.avatar_url))
            .resizable()
            .frame(width: 55, height: 55)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 10) {
                Text(self.account.login)
                Text("\(self.account.id)")
                    .font(.caption)
            }
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
        .padding(.top)
    }
}
