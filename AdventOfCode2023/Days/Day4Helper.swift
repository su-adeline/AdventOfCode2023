//
//  Day4Helper.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 04/12/2023.
//

import Foundation


class Day4Helper {
    
    func calculateWinningCard(originalCard: [Int], myCard: [Int]) -> Int {
        
        var points = 0
        for number in originalCard {
            if  let plop = myCard.first(where: { $0 == number}) {
               points = (points == 0 ? 1 : points * 2)
            }
        }
        return points
    }
    
    
    func scratchcards(filename: String) {
        
        var sumOfWinningCards = 0
        
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                
                let games = data.components(separatedBy: .newlines)
                
                for game in games {

                    var cards = game.split(whereSeparator: { $0 == ":" || $0 == "|"  })

                    if cards.count > 2 {
                        let originalCard = cards[1].split(separator: " ").map { Int($0)!}
                        let myCard = cards[2].split(separator: " ").map { Int($0)!}
                        print(originalCard)
                        print(myCard)
                        
                        sumOfWinningCards += calculateWinningCard(originalCard: originalCard, myCard: myCard)
                    }
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
        print("sum of winning cards \(sumOfWinningCards)")
        
    }
    
}
