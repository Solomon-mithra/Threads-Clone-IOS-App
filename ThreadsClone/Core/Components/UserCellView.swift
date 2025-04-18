//
//  UserCellView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/2/25.
//

import SwiftUI

struct UserCellView: View {
    let user: User
    var body: some View {
        HStack{
            CircularProfileImageView()
            
            VStack(alignment: .leading, spacing:2){
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
                
            }.font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }.padding(.horizontal)
        
    }
}

struct USerCellView_preview: PreviewProvider {
    static var previews: some View {
        UserCellView(user: dev.user)
    }
}
