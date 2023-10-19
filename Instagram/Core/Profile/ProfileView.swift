//
//  ProfileView.swift
//  Instagram
//
//  Created by Y K on 18.10.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //Header
            VStack(spacing: 10) {
                // pic and stats
                HStack{
                    Image("black-panther")
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
                   Text("Bob Bill")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Text("Forever young")
                        .font(.footnote)
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
        }
    }
}

#Preview {
    ProfileView()
}
