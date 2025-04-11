//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/2/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    //    @EnvironmentObject var viewModel: CurrentUserProfileViewModel
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack{
                    //name and profile image
                    HStack{
                        VStack(alignment: .leading){
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text("Charles Leclerc")
                        }.font(.footnote)
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem){
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView()
                            }
                        }
                    }
                    Divider()
                    
                    //bio field
                    VStack(alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio", text:$bio, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    //link field
                    VStack(alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text:$link)
                    }
                    .font(.footnote)
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                        .font(.footnote)
                    
                    Divider()
                }
                .padding()
                .background(.white)
                .cornerRadius(10)
                .padding()
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }.font(.subheadline)
                        .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button("Done"){
                        Task { try await viewModel.UpdateUserData()
                            dismiss()
                        }
                    }.font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
