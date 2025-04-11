//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/6/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                //bio stats
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 12) {
                            //fullname and username
                            VStack(alignment: .leading, spacing: 4){
                                Text(currentUser?.fullname ?? "")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text(currentUser?.username ?? "")
                                    .font(.subheadline)
                                
                            }
                            
                            if let bio = currentUser?.bio {
                                Text(bio)
                                    .font(.footnote)
                            }
                            
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(Color(.gray))
                        }
                        Spacer()
                        
                        CircularProfileImageView()
                    }
                    Button{
                        showEditProfile.toggle()
                    } label:{
                        Text("Edit Profile")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                            .cornerRadius(8)
                    }
                    
                    //user content list view
                    UserContentListView()
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                EditProfileView()
                    .environmentObject(viewModel)
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    } label:{
                        Image(systemName: "line.3.horizontal" )
                    }.padding(.vertical)
                }
                
            }.foregroundStyle(.black)
            
                .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
