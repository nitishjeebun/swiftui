//
//  FetchAccount.swift
//  swiftui-mvvm-design-pattern
//
//  Created by Huy D. on 8/6/20.
//  Copyright © 2020 Huy D. All rights reserved.
//

import Foundation
import SwiftUI

class FectchAccounts: ObservableObject {
    
    @Published var accounts: [Account] = []
    let urlString = "https://api.github.com/users/duonghominhhuy/followers"
    
    func fetchUsers() {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: url) { (data, _, _) in
            guard let users = data else {
                return
            }
            do {
                let decoder = try JSONDecoder().decode([Account].self, from: users)
                print(decoder)
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
    
}
