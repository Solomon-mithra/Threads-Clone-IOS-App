//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/1/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    
    var body: some View {
        
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users) {
                        user in
                        NavigationLink(value: user){
                            VStack {
                            UserCellView(user: user)
                            Divider()
                        }.padding(.vertical, 4)}
                    }
                }
            }
            .navigationDestination(for: User.self, destination: {
                user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
