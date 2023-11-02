//
//  ProfileView.swift
//  Instagram
//
//  Created by Y K on 18.10.2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
//    var posts: [Post] {
//        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username })
//    }
    
    var body: some View {
            ScrollView {
                VStack {
                    //Header
                    ProfileHeaderView(user: user)
                    
                    //post grid view
                    PostGridView(user: user)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}
   

#Preview {
    ProfileView(user: User.MOCK_USERS[2])
}
