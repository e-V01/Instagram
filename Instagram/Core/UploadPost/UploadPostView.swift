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
    
    var body: some View {
        VStack {
            //actio toolbar
            HStack {
                Button {
                  print("Cancel Upload")
                } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                  print("Upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
                
            }
            .padding(.horizontal)
            // post iamge an dcaption
            HStack(spacing: 8) {
                Image("batman")
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                
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
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }
}

#Preview {
    UploadPostView()
}
