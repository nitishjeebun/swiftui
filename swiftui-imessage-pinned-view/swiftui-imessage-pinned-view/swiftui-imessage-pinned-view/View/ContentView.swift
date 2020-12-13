//
//  ContentView.swift
//  swiftui-imessage-pinned-view
//
//  Created by Huy D. on 12/4/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HomeView()
                .navigationTitle("Message")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: Button(action: {}) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
