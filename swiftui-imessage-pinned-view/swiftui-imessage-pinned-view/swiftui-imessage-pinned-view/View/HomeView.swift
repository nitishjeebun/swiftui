//
//  HomeView.swift
//  swiftui-imessage-pinned-view
//
//  Created by Huy D. on 12/13/20.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 0) {
                ForEach(viewModel.messages) { message in
                    HStack {
                        Image(message.profile)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60.0, height: 60.0)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
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
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
