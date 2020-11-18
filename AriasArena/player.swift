//
//  player.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Player
class Player {
    var name: String = ""
    var composition: [Character] = [Character]()
    let limitCharacter = 3
    func createTeam() {
        print("""

Now the time has come to present your tribe, You're the \(name)
But who are your members and especially what are their roles?
A character has specific abilities, some can Attack 🤺 or Heal 🚑.
""")
        print("""

            Tell us
                1 - Witcher         - Abilities : 🤺
                2 - Shan            - Abilities : 🤺 or 🚑
                3 - Mystic          - Abilities : 🤺 or 🚑
                4 - Demon Hunter    - Abilities : 🤺
                5 - Darth Priest    - Abilities : 🤺 or 🚑
                6 - Mage            - Abilities : 🤺
                7 - Nanga           - Abilities : 🤺
                8 - Scientist       - Abilities : 🤺 or 🚑

            """)
        while composition.count < limitCharacter {
            if composition.count == 0 {
                print("Who's the first one ?")
            } else if composition.count == 1 {
                print("Who is your second ally ?")
            } else if composition.count == 2 {
                print("And who are the last ?")
            } else {
                print("Well, Your team is complete")
            }
            if let choice = readLine() {
                switch choice {
                case "1": // Witcher
                    print("The Witcher was added")
                    let witcher = Witcher()
                    composition.append(witcher)
                case "2": // Shan
                    print("The Shan was added")
                    let shan = Shan()
                    composition.append(shan)
                case "3": // Mystic
                    print("The Mystic was added")
                    let mystic = Mystic()
                    composition.append(mystic)
                case "4": // Demon Hunter
                    print("The Demon Hunter was added")
                    let demonHunter = DemonHunter()
                    composition.append(demonHunter)
                case "5": // Darth Priest
                    print("The Darth Priest was added")
                    let darthPriest = DarthPriest()
                    composition.append(darthPriest)
                case "6": // Mage
                    print("The Mage was added")
                    let mage = Mage()
                    composition.append(mage)
                case "7": // Nanga
                    print("The Nanga was added")
                    let nanga = Nanga()
                    composition.append(nanga)
                case "8": // Scientist
                    print("The Scientist was added")
                    let scientist = Scientist()
                    composition.append(scientist)
                default:
                    print("Who is in your team?")
                }
            }
        }
    }
    enum ChoiceCharacter {
        case firstchoice
        case secondchoice
        case lastchoice
    }
    func changeAlias(compo: ChoiceCharacter) {
        switch compo {
        case .firstchoice:
            print("Choose a name for your \(composition[0].name)")
            if let newAlias = readLine(), !newAlias.isEmpty {
                print("It's a \(composition[0].name) call \(newAlias)")
                composition[0].alias = newAlias
            }
        case .secondchoice:
            print("Choose a name for your \(composition[1].name)")
            if let newAlias = readLine(), !newAlias.isEmpty {
                print("It's a \(composition[1].name) call \(newAlias)")
                composition[1].alias = newAlias
            }
        case .lastchoice:
            print("Choose a name for your \(composition[2].name)")
            if let newAlias = readLine(), !newAlias.isEmpty {
                print("It's a \(composition[2].name) call \(newAlias)")
                composition[2].alias = newAlias
            }
        }
    }
    enum CompareCharacter {
        case firstchoice
        case lastchoice
    }
    func uniqueCharacter(place: CompareCharacter) -> Bool {
        let firstCharacter = composition[0].name
        let secondCharacter = composition[1].name
        let thirdCharacter = composition[2].name
        switch place {
        case .firstchoice:
            if firstCharacter != secondCharacter {
                print("it works")
                return true
            } else {
                print("This character already exist, choice an other")
                return false
            }
        case .lastchoice:
            if (firstCharacter != secondCharacter) && (secondCharacter != thirdCharacter) && (firstCharacter != thirdCharacter) {
                return true
            } else {
                print("This character already exist, choice an other")
                return false
            }
        }
    }

}
