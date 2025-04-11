//
//  UserService.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/4/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserService{
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    init(){
        Task{ try await fetchCurrentUser()}
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        
        self.currentUser = user
        
        print("DEBUG: current user \(user)")
    }
    
    func fetchUsers() async throws -> [User]{
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return []
        }
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapshot.documents.compactMap { try? $0.data(as: User.self) }
        return users.filter({ $0.id != currentUid })
    }
    
    func reset(){
        self.currentUser = nil
    }
    
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        try await Firestore.firestore(database: "users").document(currentUid).updateData(["profileImageUrl": imageUrl])
        self.currentUser?.profileImageURL = imageUrl
    }
}
