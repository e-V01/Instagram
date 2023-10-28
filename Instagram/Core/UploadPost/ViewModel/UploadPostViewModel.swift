//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Y K on 21.10.2023.
//

import Foundation
import SwiftUI
import PhotosUI
import Firebase

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }  }
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?

    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        // async in that case allwos us to avoid completion handler
        guard let item = item else { return }
        // here we make sure since item is optional we have it
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        // wea re going to await yo to load this data
        //then we are getting the data from image
        // SwiftUI to use native photosPicker
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        // then we have to create image from uiKit
        self.postImage = Image(uiImage: uiImage)
        // all in all it allows us to make asynchronous code into sync way
       
        // since it allwos us to skip completion block and runs code line by line))
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = uiImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, imageUrl: "", timestamp: Timestamp())
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
}
