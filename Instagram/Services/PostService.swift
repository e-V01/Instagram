//
//  PostService.swift
//  Instagram
//
//  Created by Y K on 02.11.2023.
//


import Foundation
import Firebase

struct PostService {
    
    private static let  postsCollection = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollection.getDocuments()
        var posts = try snapshot.documents.compactMap( { try $0.data(as: Post.self) })
        
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    // since we have to fetch data in multiple places,( feed and profileView)
    
    static func fetchUsersPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollection.whereField("ownderUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap( { try $0.data(as: Post.self) })

    }
   // where filtering happend
}
