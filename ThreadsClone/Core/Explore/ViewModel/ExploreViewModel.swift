//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/6/25.
//

import Foundation

class ExploreViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task {try await fetchUsers()}
    }
    
//    @MainActor
//    private func fetchUsers() async throws{
//        self.users = try await UserService.shared.fetchUsers()
//    }
//    
    private func fetchUsers() async throws {
        let fetchedUsers = try await UserService.shared.fetchUsers()
        await MainActor.run {
            self.users = fetchedUsers
        }
    }
}
