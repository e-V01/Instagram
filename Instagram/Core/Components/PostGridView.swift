//
//  PostGridView.swift
//  Instagram
//
//  Created by Y K on 21.10.2023.
//

import SwiftUI

struct PostGridView: View {
    var posts: [Post]
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 2) {
            ForEach(0...15, id: \.self) { index in
                Image("black-panther2")
                    .resizable()
                    .scaledToFill()
                
            }
        }
    }
}

#Preview {
    PostGridView(posts: Post.MOCK_POSTS)
}
