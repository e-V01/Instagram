//
//  ProfileView.swift
//  Instagram
//
//  Created by Y K on 18.10.2023.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
            ScrollView {
                VStack {
                    //Header
                    VStack(spacing: 10) {
                        // pic and stats
                        HStack{
                            Image(user.profileImageUrl ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            HStack (spacing: 8) {
                                UserStatView(value: 3, title: "Posts")
                                
                                UserStatView(value: 2, title: "Followers")
                                
                                UserStatView(value: 1, title: "Following")
                            }
                        }
                        .padding(.horizontal)
                        
                        // name and bio
                        VStack(alignment: .leading, spacing: 4) {
                            if let fullname = user.fullname {
                                Text(fullname)
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                            }
                            if let bio  = user.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        
                        //action button
                        Button {
                            
                        } label: {
                            Text("Edit profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 32)
                                .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color
                                            .gray,
                                                lineWidth: 1)
                                )
                        }
                        
                        Divider()
                    }
                    //post grid view
                    
                    LazyVGrid(columns: gridItems, spacing: 2) {
                        ForEach(0...15, id: \.self) { index in
                            Image("black-panther2")
                                .resizable()
                                .scaledToFill()
                            
                        }
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
    }
}
   

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
