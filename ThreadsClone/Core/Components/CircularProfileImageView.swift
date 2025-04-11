//
//  CircularProfileImageView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/2/25.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("profile2")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
