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
        ZStack {
            Image(profile.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: frame.width, height: frame.height)
                .cornerRadius(20)
        }
    }
}


