//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/4/25.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth

class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribe()
    }
    
    private func setupSubscribe(){
        AuthService.shared.$userSession.sink{ [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}

