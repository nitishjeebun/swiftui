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
    @StateObject var allMessages = Messages()
    
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
                ScrollView(.vertical, showsIndicators: false) {
                    ScrollViewReader { reader in
                        VStack(spacing: 20) {
                            ForEach(allMessages.messages) { msg in
                                ChatBubble(message: msg)
                            }
                        }
                        .padding([.horizontal, .bottom])
                        .padding(.top, 25)
                    }
                }
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
                        Button(action: {
                            let newMessage = Message(id: Date(), message: message, isMyMessage: true, profilePic: "p1", photo: nil)
                            allMessages.messages.append(newMessage)
                            self.message = ""
                        }, label: {
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

struct BubbleArrow: Shape {
    
    var isMyMessage: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: isMyMessage ?
                                    [.topLeft, .bottomLeft, .bottomRight] :
                                    [.topRight, .bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
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
