//
//  player.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Player definition
class Player {
    var name: String = ""
    static var allAlias: [String] = ["Ragnarsson"]
    var composition: [Character] = [Character]()
    let limitCharacter = 3
    // Choice characters for player team
    func createTeam(characters: [Character]) {
        var availableCharacters = characters
        print("""

Now the time has come to present your tribe, You're the \(name)
But who are your members and especially what are their roles?
A character has specific abilities, some can Attack 🤺 or Heal 💊.
Each one has its own specificities ▫️ Life and 🔹 usable weapons.

""")
        
        while composition.count < limitCharacter {
            for (index, character) in availableCharacters.enumerated() {
                print("\(index) 🔸 \(character.name)\n⚛️ Abilities : \(character.abilities)")
            }
            if composition.count == 0 {
                print("""

                    👤 Who's the first one ?
                    """)
            } else if composition.count == 1 {
                print("""

                    👤 Who is your second ally ?
                    """)
            } else if composition.count == 2 {
                print("""

                    👤 And who are the last ?
                    """)
            } else {
                print("Well, Your team is complete")
            }
            if let value = readLine(), let choice = Int(value), choice <= availableCharacters.count - 1 {
                let chooseACharacter = availableCharacters[choice]
                print("""
                👍 A \(chooseACharacter.name) join \(name) tribe !

                """)
                chooseACharacter.changeAlias()
                composition.append(chooseACharacter)
                availableCharacters.remove(at: choice)
            }
        }
    }
    /*
    func teamLife(active: Player) {

        for (_, character) in composition.enumerated() {
            let full = 1000
            let actual = character.life
            var percent = 100*full/actual
            print("\(character.name) named \(character.alias) as \(character.life) HP \(percent)")

        }

        // 🌕🌖🌗🌘🌑🌒🌓🌔
    }
    **/
    // To select a Character during the Battle
    func selectedCharacter(target: Player) -> Character {
        print("❗ \(name) you should select a companion ❗")
        for (index, character) in composition.enumerated() {
            if character.canAttack() {
                print("\(index) 🌀 \(character.name) named \(character.alias) as \(character.life) HP")
            } else if character.isDead() {
                print("""
RIP 🌀 \(character.name) named \(character.alias) is Dead 🗿 • ❌ This one can't attack anymore
""")
            }
        }
        if let value = readLine(), let choice = Int(value), choice <= composition.count - 1 {
            let selectACharacter = composition[choice]
            print("🌀 A \(selectACharacter.name) was selected ! \n")
            if selectACharacter.isDead() {
                print("Hum ! sorry but \(selectACharacter.name) is already dead, you need to choose another ally")
                return selectedCharacter(target: target)
            }
            return selectACharacter
        } else {
            return selectedCharacter(target: target)
        }
    }
    // Define the Fight action : select a character / Choice an action / Choice a target
    func fight(target: Player) {
        let currentPlayer = selectedCharacter(target: target)
        if currentPlayer.canHeal == true {
            print("""
                \(currentPlayer.name), choose your next action :
                1 • 🤺 Attack an ennemy
                2 • 💊 Healing a partner
                ⌨️ Press any key to return to the Character selection !
                """)
            if let options = readLine() {
                switch options {
                case "1":
                    game.chest.loot(current: currentPlayer)
                    let currentTarget = selectedTarget(target: target)
                    currentPlayer.attack(target: currentTarget, weapon: currentPlayer.weapon)
                case "2":
                    game.chest.loot(current: currentPlayer)
                    let currentTarget = selectedTarget(target: self)
                    currentPlayer.healing(partner: currentPlayer, target: currentTarget, weapon: currentPlayer.weapon)
                default:
                    print("""
                    Okay, just take a breath and you'll be fine.
                    Let's try again.
                    """)
                    fight(target: target)
                }
            }
        } else {
            game.chest.loot(current: currentPlayer)
            let currentTarget = selectedTarget(target: target)
            currentPlayer.attack(target: currentTarget, weapon: currentPlayer.weapon)
        }
    }
    // To select a Target during the Battle
    func selectedTarget(target: Player) -> Character {
//        teamLife(active: target)
        print("""
Select your target
1 💠 \(target.composition[0].name) is Alive: \(target.composition[0].canAttack())
2 💠 \(target.composition[1].name) is Alive: \(target.composition[1].canAttack())
3 💠 \(target.composition[2].name) is Alive: \(target.composition[2].canAttack())
""")
        if let choice = readLine() {
            switch choice {
            case "1" :
                if target.composition[0].isDead() {
                    print("Hum ! sorry but is already dead, you need to choose another target")
                    return selectedTarget(target: target)
                } else {
                    print("💠 \(target.composition[0].name) is your target \n")
                    return target.composition[0]
                }
            case "2" :
                if target.composition[1].isDead() {
                    print("Hum ! sorry but is already dead, you need to choose another target")
                    return selectedTarget(target: target)
                } else {
                    print("💠 \(target.composition[1].name) is your target \n")
                    return target.composition[1]
                }
            case "3" :
                if target.composition[2].isDead() {
                    print("Hum ! sorry but is already dead, you need to choose another target")
                    return selectedTarget(target: target)
                } else {
                    print("💠 \(target.composition[2].name) is your target \n")
                    return target.composition[2]
                }
            default :
                print("You must choose")
                return selectedTarget(target: target)
            }
        }
        return selectedTarget(target: target)
    }
    // When a Team Loose : Game is Over
    func hasLoose() -> Bool {
        if composition[0].isDead() && composition[1].isDead() && composition[2].isDead() {
            return true
        } else {
            return false
        }
    }
}
