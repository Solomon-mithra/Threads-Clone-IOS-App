//
//  AuthService.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/4/25.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthService{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
            print("DEBUG: logged In User: \(result.user.uid)")
        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, password: password, fullName: fullName, userName: userName, id: result.user.uid)
            print("DEBUG: Created User: \(result.user.uid)")
        }catch{
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    private func uploadUserData(
        withEmail email:String,
        password: String,
        fullName: String,
        userName: String,
        id: String
    ) async throws{
        let user = User(id: id, fullname: fullName, email: email, username: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser  = user
    }
}
