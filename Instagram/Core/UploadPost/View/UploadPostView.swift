//
//  UploadPostView.swift
//  Instagram
//
//  Created by Y K on 21.10.2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        VStack {
            //actio toolbar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                    // corresponds to home tab
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    Task {
                        try await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                        // corresponds to home tab
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
                
            }
            .padding(.horizontal)
            // post iamge an dcaption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                    
                
                TextField("Enter your caption...",
                          text: $caption,
                          axis: .vertical)
            }
            .padding()
            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, 
                      selection: $viewModel.selectedImage)
    }
    
    func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
        // corresponds to home tab
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
