//
//  Day1TrebuchetView.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 01/12/2023.
//

import SwiftUI

struct Day1TrebuchetView: View {
    
    @State var fileName = "no file chosen"
    @State var docData: Data?
    @State var openFile = false
    @State var successOpening = false
    
    @State var calibrationResult: Int = 0
    @State var successCalculating = false
    
    var body: some View {
        
        VStack {
            
            Spacer()
            Text(fileName)
            if successCalculating {
                Text("🌟\(calibrationResult)🌟")
                    .font(.title)
            }
            Spacer()
            
            Button {
                self.openFile.toggle()
            } label: {
                Text("Load your text file")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding(10)
                    .lineLimit(nil)
            }
            .tint(Color("AppGreen"))
            .buttonStyle(.borderedProminent)
            
            if self.successOpening && docData != nil {
                
                Button {
                    calibrationResult =  Day1Helper().calibrationDocumentValue(data: docData!)
                    successCalculating = true
                } label: {
                    Text("Calculate the calibration")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(10)
                        .lineLimit(nil)
                }
                .tint(Color("AppGreen"))
                .buttonStyle(.bordered)
   
            }
            
        }
        .padding()
        .fileImporter(
                  isPresented: $openFile,
                  allowedContentTypes: [.plainText]
              ) { result in
                  do {
                      let fileURL = try result.get()
                      print(fileURL.lastPathComponent)
                      if fileURL.startAccessingSecurityScopedResource() {
                          self.fileName  = fileURL.lastPathComponent
                          self.docData  = try Data(contentsOf:fileURL)
                          self.successOpening = true
                      }
                      
                  } catch {
                      print (error.localizedDescription)
                  }
              }
 
    }
}

#Preview {
    Day1TrebuchetView()
}
