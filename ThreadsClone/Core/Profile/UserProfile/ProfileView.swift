//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/1/25.
//

import SwiftUI

struct ProfileView: View {
    
    let user:User
    
    
    var body: some View {
        ScrollView(showsIndicators: false){
            //bio stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                Button{
                    
                } label:{
                    Text("Follow")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                //user content list view
                UserContentListView()
            }
        }
            .padding(.horizontal)
        
    }
}

struct ProfileView_preview: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}
