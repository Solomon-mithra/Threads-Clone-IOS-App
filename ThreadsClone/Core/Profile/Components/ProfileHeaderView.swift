//
//  ProfileHeaderView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/7/25.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                //fullname and username
                VStack(alignment: .leading, spacing: 4){
                    Text(user.fullname)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user.username)
                        .font(.subheadline)
                    
                }
                
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundStyle(Color(.gray))
            }
            Spacer()
            
            CircularProfileImageView()
        }}
}

//#Preview {
//    ProfileHeaderView()
//}

struct ProfileHeaderView_preview: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }
}
