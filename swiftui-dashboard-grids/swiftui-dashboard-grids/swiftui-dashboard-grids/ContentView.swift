//
//  ContentView.swift
//  swiftui-dashboard-grids
//
//  Created by Huy D. on 10/6/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color("Color").opacity(self.index == 0 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color("Color").opacity(self.index == 1 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                    }
                Spacer(minLength: 0)
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white : Color("Color").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color("Color").opacity(self.index == 2 ? 1: 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                    }
            }
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            
            TabView(selection: self.$index) {
                GridView(fitnessData: fit_Data)
                    .tag(0)
                GridView(fitnessData: week_Fit_Data)
                    .tag(1)
                VStack {
                    Text("Montly Data")
                }
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Spacer(minLength: 0)
        }
        .padding(.top)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
