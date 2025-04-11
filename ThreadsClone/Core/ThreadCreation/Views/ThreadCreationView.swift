//
//  ThreadCreationView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/1/25.
//

import SwiftUI

struct ThreadCreationView: View {
    
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack(alignment: .top){
                    CircularProfileImageView()
                    VStack(alignment: .leading, spacing: 4){
                        Text("Sophie Matthew")
                            .fontWeight(.semibold)
                        
                        TextField("Start a thread...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    Spacer()
                    if !caption.isEmpty {
                        Button{
                                caption = ""
                        } label:{
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }.font(.subheadline)
                        .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button("Post"){
                        
                    }.font(.subheadline)
                        .opacity(caption.isEmpty ? 0.5 : 1.0)
                        .disabled(caption.isEmpty)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    ThreadCreationView()
}
