//
//  Day1Helper.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 01/12/2023.
//

import Foundation


class Day1Helper {

    // find all the occurences of a substring in a string, returned as an array of indexes
    func indicesOfSubStringInString(string: String, subString: String) -> [Int] {

        var indices : [Int] = []
        var searchStartIndex = string.startIndex
        
        while searchStartIndex < string.endIndex,
              let range = string.range(of: subString, range: searchStartIndex..<string.endIndex),
              !range.isEmpty
        {
            let index = string.distance(from: string.startIndex, to: range.lowerBound)
            indices.append(index)
            searchStartIndex = range.upperBound
        }

        if indices.count > 2 {
            return [indices.first!, indices.last!]
        } else {
            return indices
        }
    }
    
    // return a string with the "number as a string" as a number in the array
    // Number is inserted in the array and not replacing the string, to manage overlap cases)
    func findStringAndAddAsNumber(initialString: String) -> String {
        
        var newString = initialString
        var  nbOfReplacement = 0
        var arrayOfUsedIndex: [Int] = []

        for index in indicesOfSubStringInString(string: initialString.lowercased(), subString: "one") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("1", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "two") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("2", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "three") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("3", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "four") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("4", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "five") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("5", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "six") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("6", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "seven") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("7", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "eight") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("8", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "nine") {

            nbOfReplacement = arrayOfUsedIndex.filter { $0 < index  }.count
            arrayOfUsedIndex.append(index)
            newString.insert("9", at: String.Index(encodedOffset: index+nbOfReplacement))
            print(newString)
        }
        
        // commenting this one since it's not in the statement of the challenge
//        for index in  indicesOfSubStringInString(string: initialString.lowercased(), subString: "zero") {
//            nbOfReplacement += 1
//            newString.insert("0", at: String.Index(encodedOffset: index+nbOfReplacement))
//        }

        return newString
    }
    
    func calibrationDocumentValue(data: Data) -> Int {
        
        var calibrationSum = 0
        var currentLineDigit = 0

        
    //    if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
//            do {
//                print(url.path)
             //   let data = try String(contentsOfFile: url.path)
        
        
                let myStrings = String(decoding: data, as: UTF8.self).components(separatedBy: .newlines)
                
                print(myStrings)
                
                for myString in myStrings {
                    
                    print(myString)
                    print(self.findStringAndAddAsNumber(initialString: myString))
                    let plop = self.findStringAndAddAsNumber(initialString: myString).filter{ $0.isNumber}
                    
                    if plop.isEmpty {
                        print("no digit in this line")
                        currentLineDigit = 0
                        print("\n\n")
                    } else if plop.count == 1 {
                        print("only one number in this line ")
                        currentLineDigit = (plop.first?.wholeNumberValue ?? 0) * 10 + (plop.first?.wholeNumberValue ?? 0)
                        print(currentLineDigit)
                        print("\n\n")
                    } else {
                        currentLineDigit = (plop.first?.wholeNumberValue ?? 0) * 10 + (plop.last?.wholeNumberValue ?? 0)
                        print(currentLineDigit)
                        print("\n\n")
                    }

                    calibrationSum += currentLineDigit
                }
                
//            } catch {
//                print("coucou")
//                print(error.localizedDescription)
//            }
     //   }
        
        print("the result is \(calibrationSum)")
        return calibrationSum
        
    }
    
}

