//
//  PostService.swift
//  Instagram
//
//  Created by Y K on 02.11.2023.
//

import Foundation
import Firebase

struct PostService {
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        var posts = try snapshot.documents.compactMap( { try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    static func fetchUsersPosts(uid: String) async throws -> [Post] {
        return []
    }
}
