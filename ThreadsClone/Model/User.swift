//
//  User.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/4/25.
//

import Foundation

struct User: Identifiable, Codable, Hashable{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageURL: String?
    var bio: String?
}
