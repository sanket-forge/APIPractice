//
//  ContentView.swift
//  APIPractice
//
//  Created by Sanket Khatua on 23/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
       
        NavigationView {
            
            List {
                
                
            }
            .navigationTitle("Courses")
            .onAppear {
                
                viewModel.fetch()
            }
        }
    }
}

#Preview {
    ContentView()
}
