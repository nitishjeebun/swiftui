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
    var body: some View {
        ZStack {
            Color("Color")
                .clipShape(CShape())
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 2:15
