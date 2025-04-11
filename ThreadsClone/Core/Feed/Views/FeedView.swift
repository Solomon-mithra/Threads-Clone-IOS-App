//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/1/25.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack{
            ScrollView(showsIndicators: false){
                LazyVStack{
                    ForEach(0 ... 10, id: \.self){
                        thread in
                        ThreadCell()
                    }
                }
            }
            .refreshable {
                print("DEBUG: Refresh Threads")
            }
            .navigationTitle("Threads")
                .navigationBarTitleDisplayMode(.inline)
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    
                } label:{
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(Color(.black))
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FeedView()
    }
}
