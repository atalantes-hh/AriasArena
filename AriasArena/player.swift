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
    
    // To select a Character during the Battle
    func selectedCharacter(target: Player) -> Character {
        print("❕ \(name) you should select a companion ❕")
        for (index, character) in composition.enumerated() {
            let fullLife = character.startLife
            let actualLife = character.life
            let percent = 100 - (((fullLife - actualLife)/fullLife)*100)
            if percent == 100 {
                print("\(index) 🌀 \(character.name) named \(character.alias) has \(character.life) HP \(percent) % 🌕 ")
            } else if percent >= 75 && percent <= 99 {
                print("\(index) 🌀 \(character.name) named \(character.alias) has \(character.life) HP \(percent) % 🌖")
            } else if percent >= 50 && percent <= 74 {
                print("\(index) 🌀 \(character.name) named \(character.alias) has \(character.life) HP \(percent) % 🌗")
            } else if percent >= 25 && percent <= 49 {
                print("\(index) 🌀 \(character.name) named \(character.alias) has \(character.life) HP \(percent) % 🌘")
            } else if percent >= 1 && percent <= 24 {
                print("\(index) 🌀 \(character.name) named \(character.alias) has \(character.life) HP \(percent) % 🌔")
            } else {
                print(" ❌ This one can't attack anymore 🌀 \(character.name) named \(character.alias) is died 🌑")
            }
        }
        if let value = readLine(), let choice = Int(value), choice <= composition.count - 1 {
            let selectACharacter = composition[choice]
            print("🌀 A \(selectACharacter.name) was selected ! \n")
            if selectACharacter.isDead() {
                print("Hum ! sorry but your \(selectACharacter.name) is already dead, you need to choose another ally")
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
        print("Select your target")
        for (index, character) in target.composition.enumerated() {
            if character.canAttack() {
                print("\(index) 💠 \(character.name) named \(character.alias) has \(character.life) HP" )
            } else if character.isDead() {
                print("""
                🌑 RIP 💠 \(character.name) named \(character.alias) is Dead • ❌ Can't be a target !
                """)
            }
        }
        if let value = readLine(), let choice = Int(value), choice <= target.composition.count - 1 {
            let selectATarget = target.composition[choice]
            print("💠 A \(selectATarget.name) was selected ! \n")
            if selectATarget.isDead() {
                print("Hum ! sorry but is already dead, you need to choose another target")
                return selectedTarget(target: target)
            }
            return selectATarget
        } else {
            print("You must choose")
            return selectedTarget(target: target)
        }
    }
    
    // When a Team Loose : Game is Over
    func hasLoose() -> Bool {
        if composition[0].isDead() && composition[1].isDead() && composition[2].isDead() {
            return true
        } else {
            return false
        }
    }
    
    // Print Stat of First Player
    func stats() {
        if self.hasLoose() {
            print("")
            print("❕ Looser Team \(name) composition was :")
        } else {
            print("")
            print("🎉 Winner Team \(name) composition was :")
        }
        for (index, character) in composition.enumerated() {
            if character.isDead() {
                print("""
\(index) 🧙 : The \(character.name) call \(character.alias) is Dead
with this \(character.weapon.gender) named \(character.weapon.name)
""")
            } else {
                print("""
\(index) 🧙 : The \(character.name) call \(character.alias) finish Alive with \(character.life) HP
and this \(character.weapon.gender) named \(character.weapon.name)
""")
            }
        }
    }
}
