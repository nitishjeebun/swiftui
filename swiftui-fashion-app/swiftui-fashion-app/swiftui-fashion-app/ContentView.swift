//
//  ContentView.swift
//  swiftui-fashion-app
//
//  Created by Huy D. on 7/17/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var search = ""
    @State var index = 0
    @State var tabIndex = 0
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .blur(radius: 35, opaque: true)
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image("menu")
                            .renderingMode(.original)
                    }
                    Spacer()
                    Image("pic")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding(.all)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        HStack {
                            Text("Find Your\nFavorite Clothes")
                                .font(.system(size: 30))
                                .foregroundColor(Color.black)
                            Spacer(minLength: 0)
                        }
                        .padding(.horizontal)
                        HStack(spacing: 25) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                            VStack(alignment: .leading) {
                                TextField("Search", text: $search)
                                Divider()
                                    .background(Color.black)
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        HStack(spacing: 15) {
                            ForEach(0..<menu.count, id: \.self) { i in
                                Button(action: {
                                    self.index = i
                                }) {
                                    VStack(spacing: 4) {
                                        Text(menu[i])
                                            .font(.system(size: 14))
                                            .foregroundColor(.black)
                                            .fontWeight(self.index == i ? .bold : .none)
                                        Circle()
                                            .fill(Color.black)
                                            .frame(width: 6, height: 6)
                                            .opacity(self.index == i ? 1 : 0)
                                    }
                                    .padding(.vertical)
                                }
                            }
                        }
                        .padding(.top, 10)
                        HStack(spacing: 15) {
                            VStack(alignment: .leading, spacing: 10) {
                                ZStack {
                                    BlurView(style: .regular)
                                    Image("p1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .rotationEffect(.init(degrees: 5))
                                    VStack {
                                        HStack {
                                            Button(action: {
                                                
                                            }) {
                                                Image(systemName: "suit.heart.fill")
                                                    .foregroundColor(.red)
                                                    .padding(.all, 10)
                                                    .background(Color.white)
                                                    .clipShape(Circle())
                                            }
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    .padding(.all, 10)
                                }
                                    // dynamic frame
                                    // padding: 30 + spacing: 15 = 45
                                    .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
                                    .cornerRadius(15)
                                Text("Summer Top")
                                    .font(.system(size: 14))
                                Text("$129")
                                    .fontWeight(.bold)
                            }
                            VStack(alignment: .leading, spacing: 10) {
                                ZStack {
                                    BlurView(style: .regular)
                                    Image("p2")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .rotationEffect(.init(degrees: 5))
                                    VStack {
                                        HStack {
                                            Button(action: {
                                                
                                            }) {
                                                Image(systemName: "suit.heart.fill")
                                                    .foregroundColor(.red)
                                                    .padding(.all, 10)
                                                    .background(Color.white)
                                                    .clipShape(Circle())
                                            }
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    .padding(.all, 10)
                                }
                                    // dynamic frame
                                    // padding: 30 + spacing: 15 = 45
                                    .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
                                    .cornerRadius(15)
                                Text("Tend Top")
                                    .font(.system(size: 14))
                                Text("$159")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.all)
                        HStack {
                            Text("New Collections")
                                .font(.system(size: 22))
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                        ZStack {
                            BlurView(style: .regular)
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Casual Top")
                                        .foregroundColor(.black)
                                    Text("$299")
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                    Button(action: {
                                        
                                    }) {
                                        Text("Try Now")
                                            .foregroundColor(.black)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal, 20)
                                            .background(Color.white)
                                            .clipShape(Capsule())
                                    }
                                    .padding(.top, 10)
                                }
                                Image("p3")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            VStack {
                                HStack {
                                    Button(action: {
                                        
                                    }) {
                                        Image(systemName: "suit.heart.fill")
                                            .foregroundColor(.red)
                                            .padding(.all, 10)
                                            .background(Color.white)
                                            .clipShape(Circle())
                                    }
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding(.all, 10)
                        }
                        .frame(height: 250)
                        .cornerRadius(15)
                        .padding(.all)
                        Spacer()
                    }
                }
                HStack(spacing: 0) {
                    Button(action: {
                        self.tabIndex = 0
                    }) {
                        Image(systemName: "suit.heart.fill")
                            .font(.system(size: 20))
                            .foregroundColor(self.tabIndex == 0 ? .white : Color("Color"))
                            .padding(.all)
                            .background(Color("Color").opacity(self.tabIndex == 0 ? 1 : 0))
                            .clipShape(Circle())
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        self.tabIndex = 1
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 20))
                            .foregroundColor(self.tabIndex == 1 ? .white : Color("Color"))
                            .padding(.all)
                            .background(Color("Color").opacity(self.tabIndex == 1 ? 1 : 0))
                            .clipShape(Circle())
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        self.tabIndex = 2
                    }) {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 20))
                            .foregroundColor(self.tabIndex == 2 ? .white : Color("Color"))
                            .padding(.all)
                            .background(Color("Color").opacity(self.tabIndex == 2 ? 1 : 0))
                            .clipShape(Circle())
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(BlurView(style: .regular))
                .clipShape(CShape())
                .shadow(radius: 4)
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

var menu = ["New","Popular","Trending","Highlights","Medium"]

// Visual effect view
struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView{
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
    
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
                .previewDisplayName("iPhone 11")
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
