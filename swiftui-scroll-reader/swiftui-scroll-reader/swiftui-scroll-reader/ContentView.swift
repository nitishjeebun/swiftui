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
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color("Color").edgesIgnoringSafeArea(.top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
