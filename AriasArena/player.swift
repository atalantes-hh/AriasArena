//
//  player.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Player
class Player {
    let name: String
    var play: Bool
    var composition: [Character]
    let limitCharacter = 3
    init(name: String) {
        self.name = name
        self.play = true
        self.composition = [Character]()
    }
func createTeam() {
    print("""
            Now the time has come to present your tribe, (you are The)
            But who are your members and especially what are their roles?
""")
        print("Tell us"
                + "1 - A Witcher"
                + "2 - A Shan"
                + "3 - A Mystic"
                + "4 - A Demon Hunter"
                + "5 - A Darth Priest"
                + "6 - A Mage"
                + "7 - A Nanga"
                + "8 - A Scientist")
        while composition.count < limitCharacter {
            if let choice = readLine() {
                switch choice {
                case "1": // Witcher
                    print()
                    composition.append(Witcher())
                case "2": // Shan
                    print()
                    composition.append(Shan())
                case "3": // Mystic
                    print()
                    composition.append(Mystic())
                case "4": // Demon Hunter
                    print()
                    composition.append(DemonHunter())
                case "5": // Darth Priest
                    print()
                    composition.append(DarthPriest())
                case "6": // Mage
                    print()
                    composition.append(Mage())
                case "7": // Nanga
                    print()
                    composition.append(Nanga())
                case "8": // Scientist
                    print()
                    composition.append(Scientist())
                default:
                    print("Who is in your team?")
                }
            }
        }
    }
    func playing() {
        if play == true {
            playing()
        } else {
            print("Next player")
        }
    }
}
