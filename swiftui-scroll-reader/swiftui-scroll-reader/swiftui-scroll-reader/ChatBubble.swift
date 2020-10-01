//
//  ChatBubble.swift
//  swiftui-scroll-reader
//
//  Created by Huy D. on 9/28/20.
//

import SwiftUI

struct ChatBubble: View {
    
    var message: Message
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            if message.isMyMessage {
                Spacer(minLength: 25)
                if message.photo == nil {
                    Text(message.message)
                        .padding(.all)
                        .background(Color.black.opacity(0.06))
                        .clipShape(BubbleArrow(isMyMessage: true))
                } else {
                    Image(uiImage: UIImage(data: message.photo!)!)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 150, height: 150)
                        .clipShape(BubbleArrow(isMyMessage: true))
                }
                Image(message.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            } else {
                Image(message.profilePic)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(message.message)
                    .foregroundColor(.white)
                    .padding(.all)
                    .background(Color("Color"))
                    .clipShape(BubbleArrow(isMyMessage: false))
                Spacer(minLength: 25)
            }
        }
        .id(message.id)
    }
    
}
