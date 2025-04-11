//
//  ThreadCell.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/2/25.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 12){
                CircularProfileImageView()
                    
                VStack(alignment: .leading, spacing: 4){
                    
                    HStack{
                        Text("Stephany")
                            .font(.footnote)
                            .fontWeight(.semibold)
                     
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3) )
                        
                        Button{
                            
                        } label:{
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    
                    Text("Formula 1 Champion")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 14){
                        Button{
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }.padding(.vertical, 8)
                        .foregroundStyle(Color(.black))
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell()
}
