//
//  ContentView.swift
//  swiftui-story-app
//
//  Created by Huy D. on 7/25/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    @State var index1 = 0
    @State var index2 = 0
    @State var stories = [
        Story(id: 0, image: "p0", offset: 0,title: "Jack the Persian and the Black Castel"),
        Story(id: 1, image: "p1", offset: 0,title: "The Dreaming Moon"),
        Story(id: 2, image: "p2", offset: 0,title: "Fallen In Love"),
        Story(id: 3, image: "p3", offset: 0,title: "Hounted Ground"),
    ]
    @State var scrolled = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image("menu")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Image("search")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                HStack {
                    Text("Trending")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold))
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Image("dots")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .rotationEffect(.init(degrees: 90))
                    }
                }
                .padding()
                HStack {
                    Text("Animated")
                        .font(.system(size: 15))
                        .foregroundColor(self.index1 == 0 ? .white : Color("Color1").opacity(0.85))
                        .fontWeight(.bold)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background(Color("Color").opacity(self.index1 == 0 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            self.index1 = 0
                    }
                    Text("25+ Stories")
                        .font(.system(size: 15))
                        .foregroundColor(self.index1 == 1 ? .white : Color("Color1").opacity(0.85))
                        .fontWeight(.bold)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background(Color("Color").opacity(self.index1 == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            self.index1 = 1
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                ZStack {
                    ForEach (stories.reversed()) { story in
                        HStack {
                            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                                Image(story.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: self.calculateWidth(), height: self.calculateHeight(id: story.id))
                                    .cornerRadius(15)
                                VStack(alignment: .leading, spacing: 18) {
                                    HStack {
                                        Text(story.title)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                    Button(action: {
                                        
                                    }) {
                                        Text("Read Later")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.vertical, 6)
                                            .padding(.horizontal, 25)
                                            .background(Color("Color1"))
                                            .clipShape(Capsule())
                                    }
                                }
                                .frame(width: self.calculateWidth() - 40)
                                .padding(.leading, 20)
                                .padding(.bottom, 20)
                            }
                            .offset(x: self.calculateXOffset(id: story.id))
                            Spacer(minLength: 0)
                        }
                        .contentShape(Rectangle())
                        .offset(x: story.offset)
                        .gesture(
                            DragGesture()
                                .onChanged({ (value) in
                                    withAnimation {
                                        guard value.translation.width < 0 && story.id != self.stories.last?.id else {
                                            // restoring card
                                            if story.id > 0 {
                                                self.stories[story.id - 1].offset = -(self.calculateWidth() + 60) + value.translation.width
                                            }
                                            return
                                        }
                                        self.stories[story.id].offset = value.translation.width
                                    }
                                })
                                .onEnded({ (value) in
                                    withAnimation {
                                        guard value.translation.width < 0 else {
                                            // restoring card
                                            if value.translation.width > 180 {
                                                self.stories[story.id - 1].offset = 0
                                                self.scrolled -= 1
                                            } else {
                                                self.stories[story.id].offset = -(self.calculateWidth() + 60)
                                                self.scrolled -= 1
                                            }
                                            return
                                        }
                                        guard -value.translation.width > 180 && story.id != self.stories.last?.id else {
                                            self.stories[story.id].offset = 0
                                            return
                                        }
                                        self.stories[story.id].offset = -(self.calculateWidth() + 60)
                                        self.scrolled += 1
                                    }
                                })
                        )
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 1.8)
                .padding(.horizontal, 25)
                .padding(.top, 25)
                HStack {
                    Text("Favorites")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold))
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }) {
                        Image("dots")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .rotationEffect(.init(degrees: 90))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 25)
                HStack {
                    Text("Latest")
                        .font(.system(size: 15))
                        .foregroundColor(self.index2 == 0 ? .white : Color("Color1").opacity(0.85))
                        .fontWeight(.bold)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background(Color("Color").opacity(self.index2 == 0 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            self.index2 = 0
                    }
                    Text("9+ Stories")
                        .font(.system(size: 15))
                        .foregroundColor(self.index2 == 1 ? .white : Color("Color1").opacity(0.85))
                        .fontWeight(.bold)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background(Color("Color").opacity(self.index2 == 1 ? 1 : 0))
                        .clipShape(Capsule())
                        .onTapGesture {
                            self.index2 = 1
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 10)
                HStack {
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width - 80, height: 250)
                        .cornerRadius(15)
                    Spacer(minLength: 0)
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom)
            }
        }
        .background(
            LinearGradient(
                gradient: .init(colors: [Color("top"), Color("bottom")]),
                startPoint: .top,
                endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
        )
    }
    
    func calculateWidth() -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width - 50
        return screenWidth - (2 * 30)
    }
    
    func calculateHeight(id: Int) -> CGFloat {
        return (UIScreen.main.bounds.height / 1.8) - CGFloat(id - self.scrolled) * 50
    }
    
    func calculateXOffset(id: Int) -> CGFloat {
        return (id - self.scrolled <= 2) ? CGFloat(id - self.scrolled) * 30 : 60
    }
    
}

struct Story : Identifiable {
    var id : Int
    var image : String
    var offset : CGFloat
    var title : String
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
