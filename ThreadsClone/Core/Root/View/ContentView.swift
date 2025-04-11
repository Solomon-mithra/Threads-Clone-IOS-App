//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Solomon Mithra on 4/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                ThreadsTabView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
