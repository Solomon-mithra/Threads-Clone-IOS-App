//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/4/25.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject{
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink{ [weak self]user in
            self?.currentUser = user
            print("DEBUG:User in viewModel from combine is: \(String(describing: user))")
        }.store(in: &cancellables)
    }
}
