//
//  ContentView.swift
//  swiftui-carousel-list
//
//  Created by Huy D. on 9/19/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var search: String = ""
    @State var index: Int = 0
    @State var columns: [GridItem] = Array(
        repeating: GridItem(.flexible(), spacing: 15),
        count: 2
    )
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                HStack {
                    Text("Game Store")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal)
                TextField("Search", text: self.$search)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.07))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 25)
                TabView(selection: self.$index) {
                    ForEach(0...5, id: \.self) { index in
                        Image("p\(index)")
                            .resizable()
                            .frame(height: self.index == index ? 230 : 180)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .tag(index)
                    }
                }
                .frame(height: 230)
                .padding(.top, 35)
                .tabViewStyle(PageTabViewStyle())
                .animation(.easeOut)
                HStack {
                    Text("Popular")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            if self.columns.count == 2{
                                self.columns.removeLast()
                            } else{
                                self.columns.append(GridItem(.flexible(), spacing: 15))
                            }
                        }
                    }, label: {
                        Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .font(.system(size: 24))
                            .foregroundColor(.black)
                    })
                }
                .padding(.horizontal)
                .padding(.top, 25)
                LazyVGrid(columns: self.columns, spacing: 25) {
                    ForEach(mockData) { data in
                        GridView(game: data, colums: self.$columns)
                    }
                }
                .padding([.horizontal, .top])
            }
            .padding(.vertical)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
