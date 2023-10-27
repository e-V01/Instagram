//
//  EditProfileViewModel.swift
//  Instagram
//
//  Created by Y K on 27.10.2023.
//

import PhotosUI
import Firebase
import SwiftUI

@MainActor
class EditProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }  }
    }
    
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    init(user: User) {
        self.user = user
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        // async in that case allwos us to avoid completion handler
        guard let item = item else { return }
        // here we make sure since item is optional we have it
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        // wea re going to await yo to load this data
        //then we are getting the data from image
        // SwiftUI to use native photosPicker
        guard let uiImage = UIImage(data: data) else { return }
        // then we have to create image from uiKit
        self.profileImage = Image(uiImage: uiImage)
        // all in all it allows us to make asynchronous code into sync way
       
        // since it allwos us to skip completion block and runs code line by line))
    }
    
    func updateUserData() async throws {
        // update profile img if changed
        
        var data = [String: Any]()
        // update name if changed
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        // update bio if changed
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
            
        }
        
        if !data.isEmpty {
            try await Firestore.firestore().collection("users").document(user.id).updateData(data)
        }
        
        
    }
}
