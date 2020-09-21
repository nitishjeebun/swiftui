//
//  GridView.swift
//  swiftui-carousel-list
//
//  Created by Huy D. on 9/20/20.
//

import SwiftUI

struct GridView: View {
    
    var game: Game
    @Binding var colums: [GridItem]
    @Namespace var namespace
    
    var body: some View {
        VStack {
            if self.colums.count == 2 {
                VStack(spacing: 15) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image(game.image)
                            .resizable()
                            .frame(height: 250)
                            .cornerRadius(15)
                        Button {
                            
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all, 10)
                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    Text(game.name)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .matchedGeometryEffect(id: "title", in: self.namespace)
                    Button {
                        
                    } label: {
                        Text("Buy Now")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 25)
                            .background(Color.red)
                            .cornerRadius(10)
                    }
                    .matchedGeometryEffect(id: "buy", in: self.namespace)
                }
            } else {
                HStack(spacing: 15) {
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image(game.image)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 250)
                            .cornerRadius(15)
                        Button {
                            
                        } label: {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .padding(.all, 10)
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.all, 10)
                    }
                    .matchedGeometryEffect(id: "image", in: self.namespace)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(game.name)
                            .fontWeight(.bold)
                            .matchedGeometryEffect(id: "title", in: self.namespace)
                        HStack(spacing: 10) {
                            ForEach(1...5, id: \.self) { rating in
                                Image(systemName: "star.fill")
                                    .foregroundColor(self.game.rating >= rating ? .yellow : .gray)
                            }
                        }
                        Button {
                            
                        } label: {
                            Text("Buy Now")
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 25)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                        .padding(.top)
                        .matchedGeometryEffect(id: "buy", in: self.namespace)
                    }
                }
                .padding(.trailing)
                .background(Color.white)
                .cornerRadius(15)
            }
        }
    }
}
