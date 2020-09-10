//
//  ContentView.swift
//  swiftui-cloud-firestore-crud-operations
//
//  Created by Huy D. on 8/23/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
