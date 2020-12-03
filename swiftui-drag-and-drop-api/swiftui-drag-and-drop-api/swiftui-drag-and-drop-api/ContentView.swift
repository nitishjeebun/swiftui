//
//  ContentView.swift
//  swiftui-drag-and-drop-api
//
//  Created by Huy D. on 12/2/20.
//

import SwiftUI
import MobileCoreServices

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
        VStack {
            // Image List
            ScrollView {
                LazyVGrid(columns: self.columns, spacing: 20) {
                    ForEach(self.viewModel.allImages) { image in
                        Image(image.imageName)
                            .resizable()
                            .frame(height: 150)
                            .cornerRadius(15)
                            .onDrag {
                                let secureCoding = URL(string: image.imageName)! as NSSecureCoding
                                let type = String(kUTTypeURL)
                                return NSItemProvider(item: .some(secureCoding), typeIdentifier: type)
                            }
                    }
                }
                .padding(.top)
                .padding(.horizontal)
            }
            // Drop Area
            ZStack {
                // Text
                if self.viewModel.selectedImages.isEmpty {
                    Text("Drop Image Here")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }
                // Selected Image List
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(self.viewModel.selectedImages, id: \.id) { image in
                            if !image.imageName.isEmpty {
                                let alignment = Alignment(horizontal: .trailing, vertical: .top)
                                ZStack(alignment: alignment) {
                                    Image(image.imageName)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(15)
                                    Button {
                                        withAnimation(.easeOut) {
                                            self.viewModel.removeImage(by: image.imageName)
                                        }
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color.black)
                                            .clipShape(Circle())
                                    }

                                }
                            }
                        }
                        Spacer(minLength: 0)
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .frame(height: self.viewModel.selectedImages.isEmpty ? 100 : nil)
            .contentShape(Rectangle())
            .background(Color.black.opacity(0.1))
            .onDrop(of: [String(kUTTypeURL)], delegate: self.viewModel)
        }
        .background(Color.black.opacity(0.05))
        .edgesIgnoringSafeArea(.bottom)
    }
}
