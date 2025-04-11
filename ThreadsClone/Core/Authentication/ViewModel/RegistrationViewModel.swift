//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/4/25.
//

import Foundation

class RegsitrationViewModel: ObservableObject {
    
    @Published  var email: String = ""
    @Published  var password: String = ""
    @Published  var fullname: String = ""
    @Published  var username: String = ""
    
    @MainActor
    func createUser() async throws{
        try await  AuthService.shared.createUser(withEmail: email, password: password, fullName: fullname, userName: username)
    }
    
}
