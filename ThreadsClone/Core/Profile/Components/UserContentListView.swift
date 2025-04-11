//
//  UserContentListView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/8/25.
//

import SwiftUI

struct UserContentListView: View {
    
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    var body: some View {
        VStack{
            HStack{
                ForEach(ProfileThreadFilter.allCases){ filter in
                    VStack{
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter{
                            Rectangle()
                                .frame(width: 180, height: 1)
                                .foregroundStyle(Color(.black))
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundStyle(Color(.clear))
                                .frame(width: 180, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()){
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack{
                ForEach(0 ... 10, id: \.self) {
                    thread in
                    ThreadCell()
                }
            }
        }.padding(.vertical, 8)

    }
}

#Preview {
    UserContentListView()
}
