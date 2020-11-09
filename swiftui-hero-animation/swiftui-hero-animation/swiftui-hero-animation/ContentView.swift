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
    @State var loadView: Bool = false
    
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
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            self.loadView.toggle()
                                        }
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
            .padding(.vertical)
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            
            // Hero View
            if self.show {
                VStack {
                    // Image
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        Image(self.selected.image)
                            .resizable()
                            .frame(height: 300)
                            .matchedGeometryEffect(id: self.selected.id, in: namespace)
                        if self.loadView {
                            HStack {
                                Button {
                                    self.loadView.toggle()
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
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.red)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                            }
                            .padding(.top, 35)
                            .padding(.horizontal)
                        }
                    }
                    // Detail View
                    ScrollView(.vertical, showsIndicators: false) {
                        if self.loadView {
                            VStack {
                                
                                // Title & Description
                                HStack {
                                    Text(self.selected.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                                    .padding(.horizontal)
                                
                                // Reviewers
                                HStack {
                                    Text("Reviewers")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                HStack(spacing: 0) {
                                    ForEach(1...5, id: \.self) { i in
                                        Image("r\(i)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .offset(x: -CGFloat(i * 20))
                                    }
                                    Spacer(minLength: 0)
                                    Button(action: {
                                        
                                    }) {
                                        Text("View All")
                                            .fontWeight(.bold)
                                    }
                                }
                                .padding(.leading, 20)
                                .padding(.top)
                                .padding(.horizontal)
                                
                                // Carousel
                                HStack {
                                    Text("Other Places")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                TabView {
                                    ForEach(1...6, id: \.self) { i in
                                        if "p\(i)" != selected.image {
                                            Image("p\(i)")
                                                .resizable()
                                                .cornerRadius(15)
                                                .padding(.horizontal)
                                        }
                                    }
                                }
                                .frame(height: 250)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .padding(.top)
                                
                                // Button
                                Button(action: {
                                    
                                }) {
                                    Text("Book Trip")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 150)
                                        .background(Color.blue)
                                        .cornerRadius(15)
                                }
                                .padding(.top,25)
                                .padding(.bottom)
                            }
                        }
                    }
                }
                .background(Color.white)
            }
        }
        .background(Color.white)
        .statusBar(hidden: self.show)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
