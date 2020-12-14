//
//  HomeView.swift
//  swiftui-imessage-pinned-view
//
//  Created by Huy D. on 12/13/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(viewModel.messages) { message in
                    ZStack {
                        HStack {
                            Color.yellow
                                .frame(width: 90)
                                .opacity(message.offset > 0 ? 1 : 0)
                            Spacer()
                            Color.red
                                .frame(width: 90)
                                .opacity(message.offset < 0 ? 1 : 0)
                        }
                        .animation(.default)
                        HStack {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "pin.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .frame(width: 90)
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "trash.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .frame(width: 90)
                        }
                        HStack {
                            Image(message.profile)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60.0, height: 60.0)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            VStack(alignment: .leading, spacing: 20) {
                                Text(message.name)
                                Text(message.message)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                                Divider()
                            }
                        }
                        .padding(.all)
                        .background(Color.white)
                        .contentShape(Rectangle())
                        .offset(x: message.offset)
                        .gesture(DragGesture().onChanged({ (value) in
                            viewModel.messages[getIndex(profile: message.profile)].offset = value.translation.width
                        }).onEnded({ (value) in
                            if value.translation.width > 80 {
                                viewModel.messages[getIndex(profile: message.profile)].offset = 90
                            } else if value.translation.width < -80 {
                                viewModel.messages[getIndex(profile: message.profile)].offset = -90
                            } else {
                                viewModel.messages[getIndex(profile: message.profile)].offset = 0
                            }
                        }))
                        .animation(.default)
                    }
                }
            }
        }
    }
    
    func getIndex(profile: String) -> Int {
        return viewModel.messages.lastIndex { (message) -> Bool in
            message.profile == profile
        } ?? 0
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
