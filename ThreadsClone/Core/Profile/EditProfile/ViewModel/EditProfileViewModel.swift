//
//  EditProfileViewModel.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/10/25.
//

import Foundation
import SwiftUI
import PhotosUI

class EditProfileViewModel: ObservableObject{
    @Published var selectedItem: PhotosPickerItem?{
        didSet{ Task {await loadImage()}}
    }
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    
    func UpdateUserData() async throws{
        try await updateProfileImage()
    
        print("DEBUG: Update User Data")
    }
    
    @MainActor
    private func loadImage() async{
        guard let item = selectedItem else {return}
        guard let data = try? await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data ) else {return}
        self.profileImage = Image(uiImage: uiImage)
    }
    
    private func updateProfileImage() async throws{
        guard let image = self.uiImage else {return}
        guard let imageUrl = try? await ImageUploader.UploadImage(image) else {return}
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
}
