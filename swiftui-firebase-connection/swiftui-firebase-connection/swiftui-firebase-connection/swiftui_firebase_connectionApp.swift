//
//  swiftui_firebase_connectionApp.swift
//  swiftui-firebase-connection
//
//  Created by Huy D. on 10/10/20.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct swiftui_firebase_connectionApp: App {
    
    // Attaching App Delegate to SwiftUI
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView(info: self.delegate)
        }
    }
}

class AppDelegate: NSObject, ObservableObject, UIApplicationDelegate {
    
    @Published var email: String = ""
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }
    
}

extension AppDelegate: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        print(error.localizedDescription)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        guard let user = user else {
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        Auth.auth().signIn(with: credential) { (result, error) in
            guard error != nil else {
                print(error?.localizedDescription ?? "Error")
                return
            }
            guard let email = result?.user.email else {
                print("No Email")
                return
            }
            self.email = email
            print(email)
        }
    }
    
}
