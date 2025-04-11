//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/1/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
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
                }
                
                NavigationLink{
                    Text("Forget Password")
                } label:{
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button{
                    Task{
                        try await viewModel.login()
                    }
                }label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink{
                    RegistrationView()
                    
                } label: {
                    HStack(spacing: 4){
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.black)
                }.padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
