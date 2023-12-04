//
//  Day4Helper.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 04/12/2023.
//

import Foundation


class Day4Helper {
    
    @Published var totalScratchCards = 0
    @Published var dict: [Int:Int] = [:]
    
    func calculateWinningCard(games: [String], gameNumber: Int) -> Int {
        
        var points = 0
        var wonScratchCards = 0
        
        if let _ = dict[gameNumber] {
            wonScratchCards = dict[gameNumber]!
            totalScratchCards += 1
        } else {
            
            let cards = games[gameNumber].split(whereSeparator: { $0 == ":" || $0 == "|" })
            if cards.count > 2 {
                
                totalScratchCards += 1
                
                let originalCard = cards[1].split(separator: " ").map { Int($0)!}
                let myCard = cards[2].split(separator: " ").map { Int($0)!}
                
                for number in originalCard {
                    if  let _ = myCard.first(where: { $0 == number}) {
                        points = (points == 0 ? 1 : points * 2)
                        wonScratchCards += 1
                    }
                }
                dict[gameNumber] = wonScratchCards
            }
            
        }
        
        if wonScratchCards > 0 {
            for i in gameNumber+1...gameNumber+wonScratchCards {
                _ = calculateWinningCard(games: games, gameNumber: i)
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
                
                for index in games.indices {
                    sumOfWinningCards += calculateWinningCard(games: games, gameNumber: index)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
        print("sum of winning cards \(sumOfWinningCards)")
        print("totalScratchCards: \(totalScratchCards)")
    }
    
}
