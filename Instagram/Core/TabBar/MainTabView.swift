//
//  MainTabView.swift
//  Instagram
//
//  Created by Y K on 18.10.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Upload Post")
                .tabItem {
                    Image(systemName: "plus.square")
                }
            
            Text("Notifications")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            CurrentUserProfileView(user: User.MOCK_USERS[1])
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .accentColor(.black)
        //TabView uses accent color instead of foreground color
    }
}

#Preview {
    MainTabView()
}
