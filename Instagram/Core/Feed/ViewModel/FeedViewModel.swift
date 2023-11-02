//
//  FeedViewModel.swift
//  Instagram
//
//  Created by Y K on 02.11.2023.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchFeedPosts()
    }
}
//        for post in posts {
//            let ownerUid = post.ownerUid
//            let postUser = try await UserService.fetchUser(withUid: ownerUid)
//            post.user = postUser
//        }
        
 
