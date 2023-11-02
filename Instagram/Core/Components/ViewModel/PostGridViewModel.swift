//
//  PostGridViewModel.swift
//  Instagram
//
//  Created by Y K on 02.11.2023.
//

import Foundation

class PostGridViewModel: ObservableObject {
    private var user: User
    @Published var posts = [Post]()
    
    init(user: User) {
        self.user = user
        
        Task { try await fetchUserPosts() }
        
    }
    
    @MainActor
    func fetchUserPosts() async throws {
        self.posts = try await PostService.fetchUsersPosts(uid: user.id)
        // once we get back post from our PostService it loops via each , it optimize, no unneccassry APi calls
        for i in 0 ..< posts.count {
            posts[i].user = self.user
        }
    }
}
