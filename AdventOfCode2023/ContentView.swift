//
//  ContentView.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 01/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            List {
                NavigationLink {
                    Day1TrebuchetView()
                } label: {
                    VStack(alignment: .leading) {
                        Text("Trebuchet")
                            .font(.title)
                        Text("Day 1")
                            .foregroundColor(Color("AppGreen"))
                    }
                }
            }
            .navigationTitle("Advent of Code 🎄")
            .navigationBarTitleDisplayMode(.large)
    
        }
        .accentColor(Color("AppGreen"))
 
    }
}

#Preview {
    ContentView()
}
