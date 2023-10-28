//
//  UploadPostViewModel.swift
//  Instagram
//
//  Created by Y K on 21.10.2023.
//

import Foundation
import SwiftUI
import PhotosUI

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }  }
    }
    
    @Published var postImage: Image?
    
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
        self.postImage = Image(uiImage: uiImage)
        // all in all it allows us to make asynchronous code into sync way
       
        // since it allwos us to skip completion block and runs code line by line))
    }
}
