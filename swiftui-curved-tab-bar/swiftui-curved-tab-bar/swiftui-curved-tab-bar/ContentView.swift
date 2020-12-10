//
//  ContentView.swift
//  swiftui-curved-tab-bar
//
//  Created by Huy D. on 12/4/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State private var index = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Color("Color")
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 0
                            }
                        }) {
                            Image("home")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 0 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                        }
                    }
                    // 28 + padding 15 = 43
                    .frame(width: 43.0, height: 43.0)
                }
                .frame(width: 43.0, height: 43.0)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                GeometryReader { geometry in
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 1
                            }
                        }) {
                            Image("search")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 1 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                        }
                    }
                    // 28 + padding 15 = 43
                    .frame(width: 43.0, height: 43.0)
                }
                .frame(width: 43.0, height: 43.0)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                GeometryReader { geometry in
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 2
                            }
                        }) {
                            Image("cart")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 2 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                        }
                    }
                    // 28 + padding 15 = 43
                    .frame(width: 43.0, height: 43.0)
                }
                .frame(width: 43.0, height: 43.0)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                GeometryReader { geometry in
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 3
                            }
                        }) {
                            Image("account")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 3 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                        }
                    }
                    // 28 + padding 15 = 43
                    .frame(width: 43.0, height: 43.0)
                }
                .frame(width: 43.0, height: 43.0)
            }
            .padding(.horizontal, 25.0)
            .padding(.top, 8.0)
            .padding(.bottom, 10.0)
            .background(Color.white)
        })
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
