//
//  ImageUploader.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/10/25.
//

import Foundation
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func UploadImage(_ image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return nil }
        let filename = NSUUID().uuidString
        let StorageRef = Storage.storage().reference(withPath: "/profile_name/\(filename)")
        
        do{
            let _ = try await StorageRef.putDataAsync(imageData)
            let url = try await StorageRef.downloadURL()
            return url.absoluteString
        } catch{
            print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
