//
//  ProfileView.swift
//  swiftui-dating-ui
//
//  Created by Huy D. on 10/9/20.
//

import SwiftUI

struct ProfileView: View {
    
    @State var profile: Profile
    var frame: CGRect
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            Image(profile.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width, height: frame.height)
            LinearGradient(gradient: .init(colors: [Color.black.opacity(0.4)]), startPoint: .center, endPoint: .bottom)
            VStack(spacing: 15) {
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text(profile.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(profile.age + " +")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    Spacer(minLength: 0)
                }
                HStack(spacing: 25) {
                    Spacer(minLength: 0)
                    Button {
                        withAnimation(Animation.easeIn(duration: 0.8)) {
                            profile.offset = -500
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color("Color"))
                            .clipShape(Circle())
                    }
                    Button {
                        withAnimation(Animation.easeIn(duration: 0.8)) {
                            profile.offset = 500
                        }
                    } label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                    Spacer(minLength: 0)
                }
            }
            .padding(.all)
        }
        .cornerRadius(20)
        .offset(x: profile.offset)
    }
}


