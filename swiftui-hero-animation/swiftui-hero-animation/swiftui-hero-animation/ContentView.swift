//
//  ContentView.swift
//  swiftui-hero-animation
//
//  Created by Huy D. on 11/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .edgesIgnoringSafeArea(.top)
    }
}

struct Home: View {
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    @State var selected: Travel = data[0]
    @State var show: Bool = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                // Top menu
                HStack {
                    Text("Travel")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image("menu")
                            .renderingMode(.original)
                    }

                }
                .padding([.horizontal, .top])
                // Grid view
                LazyVGrid(columns: columns, spacing: 25) {
                    ForEach(data) { travel in
                        VStack(alignment: .leading, spacing: 10) {
                            Image(travel.image)
                                .resizable()
                                .frame(height: 180)
                                .cornerRadius(15)
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        self.show.toggle()
                                        self.selected = travel
                                    }
                                }
                                .matchedGeometryEffect(id: travel.id, in: namespace)
                            Text(travel.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // Hero View
            if self.show {
                VStack {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(self.selected.image)
                            .resizable()
                            .frame(height: 300)
                            .matchedGeometryEffect(id: self.selected.id, in: namespace)
                        HStack {
                            Button {
                                withAnimation(.spring()) {
                                    self.show.toggle()
                                }
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                            Spacer()
                            Button {
                            } label: {
                                Image(systemName: "suit.hear.fill")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.top, 35)
                        .padding(.horizontal)
                    }
                    Spacer()
                }
                .background(Color.white)
            }
        }
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
