//
//  HomeView.swift
//  swiftui-imessage-pinned-view
//
//  Created by Huy D. on 12/13/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @Namespace var name
    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !viewModel.pinnedViews.isEmpty {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.pinnedViews) { pin in
                        Image(pin.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: (UIScreen.main.bounds.width - 70) / 3,
                                   height: ((UIScreen.main.bounds.width - 70) / 3))
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .contentShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .contextMenu {
                                Button(action: {
                                    withAnimation(.default) {
                                        let index = viewModel.pinnedViews.lastIndex { (p) -> Bool in
                                            p.profile == pin.profile
                                        } ?? 0
                                        viewModel.pinnedViews.remove(at: index)
                                        viewModel.messages.append(pin)
                                    }
                                }) {
                                    Text("Remove")
                                }
                            }
                            .matchedGeometryEffect(id: pin.profile, in: name)
                    }
                }
                .padding()
            }
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
                        HStack {
                            Button(action: {
                                withAnimation(.default) {
                                    let index: Int = getIndex(profile: message.profile)
                                    var pinnedMessage: Message = viewModel.messages[index]
                                    pinnedMessage.offset = 0
                                    viewModel.pinnedViews.append(pinnedMessage)
                                    viewModel.messages.removeAll { (m) -> Bool in
                                        m.profile == message.profile
                                    }
                                }
                            }, label: {
                                Image(systemName: "pin.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                            })
                            .frame(width: 90)
                            Spacer()
                            Button(action: {
                                withAnimation(.default) {
                                    viewModel.messages.removeAll { (m) -> Bool in
                                        m.profile == message.profile
                                    }
                                }
                            }, label: {
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
                                .matchedGeometryEffect(id: message.profile, in: name)
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
                            withAnimation(.default) {
                                viewModel.messages[getIndex(profile: message.profile)].offset = value.translation.width
                            }
                        }).onEnded({ (value) in
                            withAnimation(.default) {
                                if value.translation.width > 80 {
                                    viewModel.messages[getIndex(profile: message.profile)].offset = 90
                                } else if value.translation.width < -80 {
                                    viewModel.messages[getIndex(profile: message.profile)].offset = -90
                                } else {
                                    viewModel.messages[getIndex(profile: message.profile)].offset = 0
                                }
                            }
                        }))
                    }
                }
            }
            .padding(.vertical)
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
