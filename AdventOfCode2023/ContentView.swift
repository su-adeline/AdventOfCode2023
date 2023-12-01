//
//  ContentView.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 01/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Advent of Code 🎄")
                .font(.title)
        }
        .padding()
        .onAppear {
           _ = Day1Helper.calibrationDocumentValue(filename: "day1file")
        }
    }
}

#Preview {
    ContentView()
}
