//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/1/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegsitrationViewModel()
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Image("Threads_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            VStack{
                TextField("Enter your email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .modifier(TextFieldViewModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(TextFieldViewModifier())
                
                TextField("Enter your Full Name", text: $viewModel.fullname)
                    .modifier(TextFieldViewModifier())
                
                TextField("Enter your User name", text: $viewModel.username)
                    .modifier(TextFieldViewModifier())
                
                Button{
                    Task{
                        try await viewModel.createUser()
                    }
                }label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }.padding(.vertical)
                
                
            }
            
            Spacer()
            
            Divider()
            
            Button{
                dismiss()
            } label: {
                HStack(spacing: 4){
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(.black)
            }.padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
