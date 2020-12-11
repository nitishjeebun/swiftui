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
    @State private var curvePosition: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
            Color("Color")
            // Tab Bar
            HStack {
                GeometryReader { geometry in
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 0
                                self.curvePosition = geometry.frame(in: .global).midX
                            }
                        }) {
                            Image("home")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 0 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                                // animating View...
                                .background(Color.white.opacity(index == 0 ? 1 : 0).clipShape(Circle()))
                                .offset(y: index == 0 ? -35 : 0)
                        }
                    }
                    // 28 + padding 15 = 43
                    .frame(width: 43.0, height: 43.0)
                    .onAppear(perform: {
                        DispatchQueue.main.async {
                            self.curvePosition = geometry.frame(in: .global).midX
                        }
                    })
                }
                .frame(width: 43.0, height: 43.0)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                GeometryReader { geometry in
                    VStack {
                        Button(action: {
                            withAnimation(.spring()) {
                                index = 1
                                self.curvePosition = geometry.frame(in: .global).midX
                            }
                        }) {
                            Image("search")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 1 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                                // animating View...
                                .background(Color.white.opacity(index == 1 ? 1 : 0).clipShape(Circle()))
                                .offset(y: index == 1 ? -35 : 0)
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
                                self.curvePosition = geometry.frame(in: .global).midX
                            }
                        }) {
                            Image("cart")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 2 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                                // animating View...
                                .background(Color.white.opacity(index == 2 ? 1 : 0).clipShape(Circle()))
                                .offset(y: index == 2 ? -35 : 0)
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
                                self.curvePosition = geometry.frame(in: .global).midX
                            }
                        }) {
                            Image("account")
                                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                                .resizable()
                                .foregroundColor(index == 3 ? .black : .gray)
                                .frame(width: 28.0, height: 28.0)
                                .padding(.all, 15.0)
                                // animating View...
                                .background(Color.white.opacity(index == 3 ? 1 : 0).clipShape(Circle()))
                                .offset(y: index == 3 ? -35 : 0)
                        }
                    }
                    // 28 + padding 15 = 43
                    .frame(width: 43.0, height: 43.0)
                }
                .frame(width: 43.0, height: 43.0)
            }
            .padding(.top, 8)
            .padding(.horizontal, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 25 : 35)
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 8 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white.clipShape(CShape(curvePos: curvePosition)))
        })
        .edgesIgnoringSafeArea(.all)
    }
}

struct CShape: Shape {
    var curvePos: CGFloat
    var animatableData: CGFloat {
        get { return curvePos }
        set { curvePos = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            // path
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            // curve
            path.move(to: CGPoint(x: curvePos + 40, y: 0))
            path.addQuadCurve(to: CGPoint(x: curvePos - 40, y: 0),
                              control: CGPoint(x: curvePos, y: 70))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
