//
//  PreviewProvider.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/6/25.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Max Verstopping", email: "max@gmail.com", username: "maxverstoppen1")
}
