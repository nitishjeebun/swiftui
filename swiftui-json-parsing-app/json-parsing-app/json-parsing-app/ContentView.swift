//
//  ContentView.swift
//  json-parsing-app
//
//  Created by Huy D. on 7/18/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import SwiftUI
import URLImage

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationBarTitle("GitHub Users")
        }
    }
}

struct Home: View {
    @State var users: [JSONData] = []
    var body: some View {
        VStack {
            if users.isEmpty {
                Spacer()
                Text("Downloading…")
                Spacer()
            } else {
                List(users) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        RowView(user: user)
                    }
                }
            }
        }
        .navigationBarItems(trailing:
            Button(action: {
                self.users.removeAll()
                getUserData(urlString: "https://api.github.com/users") { (users) in
                    self.users = users
                }
            }, label: {
                Image(systemName: "arrow.clockwise")
            })
        )
            .onAppear {
                getUserData(urlString: "https://api.github.com/users") { (users) in
                    self.users = users
                }
        }
    }
}

struct RowView: View {
    var user: JSONData
    var body: some View {
        HStack(spacing: 15) {
            Avatar(urlString: user.avatar_url)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 5)
                .aspectRatio(contentMode: .fill)
            Text(user.login)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(.vertical, 4)
    }
}

struct Avatar: View {
    var urlString: String
    var body: some View {
        URLImage(
            URL(string: urlString)!,
            delay: 1.0,
            placeholder: Image(systemName: "person.crop.circle")
                .resizable()
        ) { imageProxy in
            imageProxy.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
        }
    }
}

struct DetailView: View {
    var user: JSONData
    @State var followers: [JSONData] = []
    @State var isEmpty = false
    var body: some View {
        VStack {
            if followers.isEmpty {
                Spacer()
                if isEmpty {
                    Text("No Followers")
                        .fontWeight(.bold)
                } else {
                    Text("Loading...")
                }
                Spacer()
            } else {
                List {
                    Text("Followers")
                    ForEach(followers) { follower in
                        RowView(user: follower)
                    }
                }
                .listStyle(GroupedListStyle())
            }
        }
        .navigationBarTitle(user.login)
        .onAppear {
            getUserData(urlString: self.user.followers_url) { (followers) in
                if followers.isEmpty {
                    self.isEmpty = true
                } else {
                    self.followers = followers
                }
            }
        }
    }
}

struct JSONData: Identifiable, Decodable {
    var id: Int
    var login: String
    var avatar_url: String
    var followers_url: String
}

func getUserData(urlString: String, completion: @escaping([JSONData]) -> ()) {
    
    guard let url = URL(string: urlString) else {
        completion([])
        return
    }
    
    let session = URLSession(configuration: .default)
    session.dataTask(with: url) { (data, _, error) in
        guard let data = data else {
            completion([])
            return
        }
        do {
            let users = try JSONDecoder().decode([JSONData].self, from: data)
            completion(users)
        } catch {
            print("Error: \(error)")
        }
    }
    .resume()
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



