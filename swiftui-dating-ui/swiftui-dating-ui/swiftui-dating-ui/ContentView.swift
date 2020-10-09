//
//  ContentView.swift
//  swiftui-dating-ui
//
//  Created by Huy D. on 10/7/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var profiles = [
        Profile(id: 0, name: "Annie Watson", image: "p0", age: "27", offset: 0),
        Profile(id: 1, name: "Clarie", image: "p1", age: "19", offset: 0),
        Profile(id: 2, name: "Catherine", image: "p2", age: "25", offset: 0),
        Profile(id: 3, name: "Emma", image: "p3", age: "26", offset: 0),
        Profile(id: 4, name: "Juliana", image: "p4", age: "20", offset: 0),
        Profile(id: 5, name: "Kaviya", image: "p5", age: "22", offset: 0),
        Profile(id: 6, name: "Jill", image: "p6", age: "18", offset: 0),
        Profile(id: 7, name: "Terasa", image: "p7", age: "29", offset: 0),
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image("menu")
                        .renderingMode(.template)
                }
                Text("Blind Dating")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer(minLength: 0)
                Button {
                    
                } label: {
                    Image("noti")
                        .renderingMode(.template)
                }
            }
            .foregroundColor(.black)
            .padding()
            GeometryReader { g in
                ZStack {
                    ForEach(profiles.reversed()) { profile in
                        ProfileView(profile: profile, frame: g.frame(in: .global))
                    }
                }
            }
            .padding([.horizontal,.bottom])
            Spacer(minLength: 0)
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
