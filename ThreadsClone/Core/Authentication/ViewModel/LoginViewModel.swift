//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/4/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published  var email: String = ""
    @Published  var password: String = ""
    
    @MainActor
    func login() async throws{
        try await  AuthService.shared.login(withEmail: email, password: password)
    }
    
}
