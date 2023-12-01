//
//  Day1Helper.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 01/12/2023.
//

import Foundation

class Day1Helper {
    
    static func calibrationDocumentValue(filename: String) -> Int {
        
        var calibrationSum = 0
        var currentLineDigit = 0
        
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                
                for myString in myStrings {
                    
                    let plop =  myString.filter{ $0.isNumber}
                    
                    if plop.isEmpty {
                        print("no digit in this line")
                        currentLineDigit = 0
                    } else if plop.count == 1 {
                        print("only one number in this line ")
                        currentLineDigit = (plop.first?.wholeNumberValue ?? 0) * 10 + (plop.first?.wholeNumberValue ?? 0)
                        print(currentLineDigit)
                    } else {
                        currentLineDigit = (plop.first?.wholeNumberValue ?? 0) * 10 + (plop.last?.wholeNumberValue ?? 0)
                        print(currentLineDigit)
                    }
                    calibrationSum += currentLineDigit
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        
        print("the result is \(calibrationSum)")
        return calibrationSum
        
    }
    
}
