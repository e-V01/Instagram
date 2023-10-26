//
//  AuthService.swift
//  Instagram
//
//  Created by Y K on 22.10.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        // if we have our user logged in or not
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: failed to log in user with error \(error.localizedDescription)")
            
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: did create user...")
            await uploadUserData(uid: result.user.uid, username: username, email: email)
        print("DEBUG: did upload user data...")
        } catch {
            print("DEBUG: failed to register user with error \(error.localizedDescription)")
            
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        // private since we won`t need to use else wehre beyond that file
        // async only because upload, so no throws needed to handle errors
        let user = User(id: uid, username: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return}
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
