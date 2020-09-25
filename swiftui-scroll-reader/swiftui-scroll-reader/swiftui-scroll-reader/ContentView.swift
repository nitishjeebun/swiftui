//
//  ContentView.swift
//  swiftui-scroll-reader
//
//  Created by Huy D. on 9/23/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var message: String = ""
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "gear")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                    })
                }
                VStack(spacing: 5) {
                    Text("Catherine")
                        .fontWeight(.bold)
                    Text("Active")
                        .font(.caption)
                }
                .foregroundColor(.white)
            }
            .padding(.all)
            VStack {
                Spacer()
                HStack(spacing: 15) {
                    HStack(spacing: 15) {
                        TextField("Message", text: self.$message)
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "paperclip.circle.fill")
                                .font(.system(size: 22))
                                .foregroundColor(.gray)
                        })
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.black.opacity(0.06))
                    .clipShape(Capsule())
                    if message != "" {
                        Button(action: {}, label: {
                            Image(systemName: "paperplane.fill")
                                .font(.system(size: 22))
                                .foregroundColor(Color("Color"))
                                .rotationEffect(.init(degrees: 45))
                                .padding(.vertical, 12)
                                .padding(.leading, 12)
                                .padding(.trailing, 17)
                                .background(Color.black.opacity(0.07))
                                .clipShape(Circle())
                        })
                    }
                }
                .padding(.horizontal)
                .animation(.easeOut)
            }
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white)
            .clipShape(RoundedShape())
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("Color").edgesIgnoringSafeArea(.top))
    }
}

struct RoundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
