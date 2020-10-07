//
//  GridView.swift
//  swiftui-dashboard-grids
//
//  Created by Huy D. on 10/7/20.
//

import SwiftUI

struct GridView: View {
    
    var fitnessData: [Fitness]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(fitnessData) { fitness in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                    VStack (alignment: .leading, spacing: 15) {
                        Text(fitness.title)
                            .foregroundColor(.white)
                        Text(fitness.data)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        HStack {
                            Spacer(minLength: 0)
                            Text(fitness.suggest)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color(fitness.image))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    Image(fitness.image)
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.12))
                        .clipShape(Circle())
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 25)
    }
    
}

