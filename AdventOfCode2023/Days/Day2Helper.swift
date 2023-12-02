//
//  Day2Helper.swift
//  AdventOfCode2023
//
//  Created by Adeline Susset on 02/12/2023.
//

import Foundation
import RegexBuilder

class Day2Helper {
    
    let gameRegex = Regex {
        "Game"
        OneOrMore(.whitespace)
        TryCapture {
           OneOrMore(.digit)
         } transform: {
           Int($0)
         }
    }
    
    let redRegex = Regex {
        OneOrMore(.digit)
        OneOrMore(.whitespace)
        "red"
    }

    let greenRegex = Regex {
        OneOrMore(.digit)
        OneOrMore(.whitespace)
        "green"
    }
    
    let blueRegex = Regex {
        OneOrMore(.digit)
        OneOrMore(.whitespace)
        "blue"
    }

    // MARK: PART 2
    func minimuPowerCubes(game: String, nbRedCudes: Int, nbGreenCudes: Int, nbBlueCudes: Int) -> Int {
        
        var minimumRed = 0
        var minimumGreen = 0
        var minimumBlue = 0
        
        // *** Red
        let matchesRed = game.matches(of: redRegex)
        for match in matchesRed {
            if let nbRedInBox = match.output.split(separator: " ").first {
                if minimumRed < (nbRedInBox as NSString).integerValue {
                    minimumRed = (nbRedInBox as NSString).integerValue
                    Swift.print("new min red \(minimumRed)")
                }
            }
        }
        
        // *** Green
        let matchesGreen = game.matches(of: greenRegex)
        for match in matchesGreen {
            if let nbGreenInBox = match.output.split(separator: " ").first {
                    if minimumGreen < (nbGreenInBox as NSString).integerValue {
                        minimumGreen = (nbGreenInBox as NSString).integerValue
                        Swift.print("new min green \(minimumGreen)")
                    }
                }
            }
        
        // *** Blue
        let matchesBlue = game.matches(of: blueRegex)
        for match in matchesBlue {
            if let nbBlueInBox = match.output.split(separator: " ").first {
                    if minimumBlue < (nbBlueInBox as NSString).integerValue {
                        minimumBlue = (nbBlueInBox as NSString).integerValue
                        print("new min blue \(minimumBlue)")
                    }
                }
            }
        
        return minimumRed * minimumGreen * minimumBlue
    }
    
    // MARK: PART 1
    // function will return 0 if game is not possible, id of the game if possible
    func returnedIdIfGameIsPossible(game: String, nbRedCudes: Int, nbGreenCudes: Int, nbBlueCudes: Int) -> Int {
        
        var isGamePossible = true

        // *** Red
        let matchesRed = game.matches(of: redRegex)
        print("red")
        outerLoopRed: for match in matchesRed {
            if let nbRedInBox = match.output.split(separator: " ").first {
                if nbRedCudes < (nbRedInBox as NSString).integerValue {
                    isGamePossible = false
                    break outerLoopRed
                }
            }
        }
        
        // *** Green
        let matchesGreen = game.matches(of: greenRegex)
        outerLoopGreen: for match in matchesGreen {
            if let nbGreenInBox = match.output.split(separator: " ").first {
                if nbGreenCudes < (nbGreenInBox as NSString).integerValue {
                    isGamePossible = false
                    break outerLoopGreen
                }
            }
        }
        
        // *** Blue
        let matchesBlue = game.matches(of: blueRegex)
        outerLoopBlue: for match in matchesBlue{
            if let nbBlueInBox = match.output.split(separator: " ").first {
                if nbBlueCudes < (nbBlueInBox as NSString).integerValue {
                    isGamePossible = false
                    break outerLoopBlue
                }
            }
        }
        
        if isGamePossible {
            
            if let result = game.firstMatch(of: gameRegex) {
                return Int(result.1)
            }
        }
            else {
            return 0
        }

        return 0
        
    }
    
    func cubeConundrum(filename: String, nbRedCudes: Int, nbGreenCudes: Int, nbBlueCudes: Int) {
        
        var sumOfidGames = 0
        var sumOfMinimumPowerCubes = 0
        
        if let path = Bundle.main.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let games = data.components(separatedBy: .newlines)
                
                for game in games {
                    print(game)
                    sumOfidGames += returnedIdIfGameIsPossible(game: game, nbRedCudes: nbRedCudes, nbGreenCudes: nbGreenCudes, nbBlueCudes: nbBlueCudes)
                    
                    sumOfMinimumPowerCubes += minimuPowerCubes(game: game, nbRedCudes: nbRedCudes, nbGreenCudes: nbGreenCudes, nbBlueCudes: nbBlueCudes)
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
        }
        print("sum of id games \(sumOfidGames)")
        print("sum of minimum power cubes \(sumOfMinimumPowerCubes)")
        
    }
    
}
