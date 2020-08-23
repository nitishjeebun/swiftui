//
//  Home.swift
//  swiftui-full-stack-login-page
//
//  Created by Huy D. on 8/22/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { _ in
            VStack {
                Text("Welcome to Homescreen !!!")
            }
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
