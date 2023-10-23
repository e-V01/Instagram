//
//  AuthService.swift
//  Instagram
//
//  Created by Y K on 22.10.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        // if we have our user logged in or not
    }
    
    func login(withEmail email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: failed to register user with error \(error.localizedDescription)")
            
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        
    }
}
