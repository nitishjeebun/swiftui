//
//  ContentView.swift
//  swiftui-fitness-dashboard
//
//  Created by Huy D. on 10/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Hello World")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Spacer(minLength: 0)
                    Button {
                        
                    } label: {
                        Image("menu")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }

                }
                .padding()
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
