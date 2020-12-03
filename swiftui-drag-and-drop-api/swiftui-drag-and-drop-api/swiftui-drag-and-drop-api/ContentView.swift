//
//  ContentView.swift
//  swiftui-drag-and-drop-api
//
//  Created by Huy D. on 12/2/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationTitle("Drag Images")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Home: View {
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @ObservedObject var viewModel = ImageViewModel()
    
    var body: some View {
        VStack(spacing: 15) {
            ScrollView {
                LazyVGrid(columns: self.columns, spacing: 20) {
                    ForEach(self.viewModel.allImages) { image in
                        Image(image.imageName)
                            .resizable()
                            .frame(height: 150)
                            .cornerRadius(15)
                    }
                }
                .padding(.all)
            }
        }
    }
}
