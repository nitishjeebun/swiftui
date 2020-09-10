//
//  ContentView.swift
//  swiftui-shoe-app
//
//  Created by Huy D. on 7/14/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainVew()
    }
}

struct MainVew: View {
    @State var index = 0
    @State var show = false
    @State var selectedIndex = 0
    @State var topIndex = 0
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // tab view with tabs...
                
                // change tabs based on index...
                
                VStack {
                    HStack {
                        Image("logo").renderingMode(.original)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image("menu").renderingMode(.original)
                        }
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            ForEach(0..<topMenu.count) {menu in
                                TopMenu(menu: menu, index: self.$topIndex)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)
                    HStack {
                        VerticalMenu()
                            .padding(.leading, -165)
                            .zIndex(1)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(1...6, id: \.self) { i in
                                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                                        Image("logo")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(height: 110)
                                            .foregroundColor(Color.black.opacity(0.08))
                                            .padding(.top, 55)
                                            .padding(.horizontal)
                                        VStack(alignment: .leading) {
                                            Text("$250")
                                                .font(.system(size: 22))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            Spacer(minLength: 0)
                                            Image("p\(i)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .rotationEffect(.init(degrees: 12))
                                            Spacer(minLength: 0)
                                            Text("Men's Shoe")
                                                .foregroundColor(Color.white.opacity(0.6))
                                            Text("Nike Air Huarache\nRun DNA")
                                                .font(.system(size: 22))
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 150, height: 360)
                                    .background(Color("Color\(i)"))
                                    .cornerRadius(15)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            self.selectedIndex = i
                                            self.show.toggle()
                                        }
                                    }
                                }
                            }
                            .padding(.leading, 20)
                            .padding(.trailing)
                        }
                        .padding(.leading, -165)
                    }
                    .padding(.top, 30)
                    .frame(height: 400)
                    
                    HStack {
                        Text("New Releases")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Spacer()
                        Text("1/2")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(2...6, id: \.self) { i in
                                Image("p\(i)")
                                    .resizable()
                                    .frame(width: 65, height: 35)
                                    .rotationEffect(.init(degrees: 12))
                                    .padding(.vertical, 25)
                                    .padding(.horizontal)
                                    .background(Color("Color\(i)"))
                                    .cornerRadius(15)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 10)
                    
                    Spacer(minLength: 0)
                }
                    // sice all edges ignored...
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                
                // tab view...
                
                HStack(spacing: 0) {
                    Button(action: {
                        withAnimation {
                            self.index = 0
                        }
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "house.fill")
                                .foregroundColor(index == 0 ? .white : Color.black.opacity(0.35))
                                .padding(10)
                                .background(index == 0 ? .black : Color.clear)
                                .cornerRadius(8)
                            Text(index == 0 ? "Home" : "")
                                .foregroundColor(.black)
                        }
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        withAnimation {
                            self.index = 1
                        }
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "suit.heart")
                                .foregroundColor(index == 1 ? .white : Color.black.opacity(0.35))
                                .padding(10)
                                .background(index == 1 ? .black : Color.clear)
                                .cornerRadius(8)
                            Text(index == 1 ? "Loved" : "")
                                .foregroundColor(.black)
                        }
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        withAnimation {
                            self.index = 2
                        }
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "person.fill")
                                .foregroundColor(index == 2 ? .white : Color.black.opacity(0.35))
                                .padding(10)
                                .background(index == 2 ? .black : Color.clear)
                                .cornerRadius(8)
                            Text(index == 2 ? "Account" : "")
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding(.top)
                .padding(.horizontal, 25)
                .padding(.bottom, 80)
                .background(Color.white)
            }
            if show {
                VStack {
                    VStack {
                        HStack {
                            Button(action: {
                                
                            }) {
                                Image(systemName: "suit.heart")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Button(action: {
                                withAnimation(.spring()) {
                                    self.show.toggle()
                                }
                            }) {
                                Image(systemName: "xmark")
                                    .font(.system(size: 22))
                                    .foregroundColor(.white)
                            }
                        }
                        Image("p\(selectedIndex)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 250)
                            .rotationEffect(.init(degrees: 12))
                    }
                    .padding()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color("Color\(selectedIndex)"))
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Men's Shoe")
                                .foregroundColor(.gray)
                            Text("Nike Air Huarache Run DNA")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Text("$249")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding()
                    Text("The Nike Air Huarache Run DNA Ch. 1 re-imagines not only the original Air Huarache design, but incorporates elements from another legendary icon, the Air Max...")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.top, 20)
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Colors")
                                .font(.title)
                            HStack(spacing: 15) {
                                
                                ForEach((1...6).filter({$0 != self.selectedIndex}), id: \.self) { i in
                                    Button(action: {

                                    }) {
                                        Circle()
                                        .fill(Color("Color\(i)"))
                                            .frame(width: 22, height: 22)
                                    }
                                }
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal)
                    .padding(.top, 25)
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Add To Cart")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(Color.black)
                        .clipShape(Capsule())
                    }
                    .padding(.bottom, 40)
                }
                .background(Color.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}

var topMenu = ["Shoes", "Clothing", "By Sports", "By Branch", "By Price"]

struct TopMenu: View {
    var menu: Int
    @Binding var index: Int
    var body: some View {
        VStack(spacing: 8) {
            Text(topMenu[menu])
                .font(.system(size: 22))
                .fontWeight(self.index == menu ? .bold : .none)
                .foregroundColor(self.index == menu ? .black : .gray)
            Circle()
                .fill(Color.black)
                .frame(width: 10, height: 10)
                .opacity(self.index == menu ? 1 : 0)
        }.onTapGesture {
            self.index = self.menu
        }
    }
}

struct VerticalMenu: View {
    @State var index = 0
    var body: some View {
        HStack(spacing: 0) {
            Button(action: {
                self.index = 0
            }, label: {
                VStack(spacing: 5) {
                    Text("Men")
                        .fontWeight(index == 0 ? .bold : .none)
                        .foregroundColor(index == 0 ? .black : .gray)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 0 ? 1 : 0)
                }
            }).padding(.leading)
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 1
            }, label: {
                VStack(spacing: 5) {
                    Text("Women")
                        .fontWeight(index == 1 ? .bold : .none)
                        .foregroundColor(index == 1 ? .black : .gray)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 1 ? 1 : 0)
                }
            })
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 2
            }, label: {
                VStack(spacing: 5) {
                    Text("Sports")
                        .fontWeight(index == 2 ? .bold : .none)
                        .foregroundColor(index == 2 ? .black : .gray)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 2 ? 1 : 0)
                }
            })
            
            Spacer(minLength: 0)
            
            Button(action: {
                self.index = 3
            }, label: {
                VStack(spacing: 5) {
                    Text("Kids")
                        .fontWeight(index == 3 ? .bold : .none)
                        .foregroundColor(index == 3 ? .black : .gray)
                    Circle()
                        .fill(Color.black)
                        .frame(width: 8, height: 8)
                        .opacity(index == 3 ? 1 : 0)
                }
            }).padding(.trailing)
            
        }
        .padding(.vertical, 30)
        .frame(width: 400)
        .background(Color.black.opacity(0.1))
        .cornerRadius(15)
        .rotationEffect(.init(degrees: -90))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
            .previewDisplayName("iPhone XS Max")
    }
}
