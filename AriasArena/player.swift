//
//  player.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Player : Define Composition, Fight Actions, Loose case, and Statistics
class Player {
    var name: String = ""
    static var allAlias: [String] = ["Ragnarsson"]
    var composition: [Character] = [Character]()
    let limitCharacter = 3
    
    // Choice 3 characters for player team
    internal func createTeam(characters: [Character]) {
        var availableCharacters = characters
        print("")
        print("""
Now the time has come to present your tribe, You're the \(name)
But who are your members and especially what are their roles?
A character has specific abilities, some can Attack ⚔️ or Heal 💊.
Each one has its own specificities ▫️ Life and 🔹 usable weapons.
""")
        print("")
        while composition.count < limitCharacter {
            for (index, character) in availableCharacters.enumerated() {
                print("\(index) 🔸 \(character.name)\n⚛️ Abilities : \(character.abilities)")
            }
            if composition.count == 0 {
                print("")
                print("👤 Who's the first one ?")
            } else if composition.count == 1 {
                print("")
                print("👤 Who is your second ally ?")
            } else if composition.count == 2 {
                print("")
                print("👤 And who are the last ?")
            } else {
            }
            if let value = readLine(), let choice = Int(value), choice <= availableCharacters.count - 1 {
                let chooseACharacter = availableCharacters[choice]
                print("☑️ A \(chooseACharacter.name) join \(name) tribe !")
                print("")
                chooseACharacter.changeAlias()
                composition.append(chooseACharacter)
                availableCharacters.remove(at: choice)
            }
        }
    }
    
    // To select a Character during the Battle
    private func selectedCharacter(target: Player) -> Character {
        print("")
        print("❕ \(name) you should select a companion ❕")
        for (index, character) in composition.enumerated() {
            let currentLife = character.life
            let lifeThreeQuarter = (character.startLife * 3/4)
            let halfLife = (character.startLife * 1/2)
            let lifeLastQuarter = (character.startLife * 1/4)
            if currentLife == character.startLife {
                print("\(index) ◽️ \(character.name) named \(character.alias) has \(character.life) HP • 🔆")
            } else if currentLife >= lifeThreeQuarter {
                print("\(index) ◽️ \(character.name) named \(character.alias) has \(character.life) HP • 🌕")
            } else if (currentLife >= halfLife) && (currentLife < lifeThreeQuarter) {
                print("\(index) ◽️ \(character.name) named \(character.alias) has \(character.life) HP • 🌖")
            } else if (currentLife < halfLife) && (currentLife > lifeLastQuarter) {
                print("\(index) ◽️ \(character.name) named \(character.alias) has \(character.life) HP • 🌗")
            } else if (currentLife <= lifeLastQuarter) && !character.isDead() {
                print("\(index) ◽️ \(character.name) named \(character.alias) has \(character.life) HP • 🌘")
            } else {
                print(" ❌ This one can't attack anymore ◽️ \(character.name) named \(character.alias) is died 🌑")
            }
        }
        if let value = readLine(), let choice = Int(value), choice <= composition.count - 1 {
            let selectACharacter = composition[choice]
            print("🟢 A \(selectACharacter.name) was selected ! \n")
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
    internal func fight(target: Player) {
        let currentPlayer = selectedCharacter(target: target)
        if currentPlayer.canHeal == true {
            print("""
                \(currentPlayer.name), choose your next action :
                1 • 🤺 Attack an ennemy
                2 • 💊 Healing a partner
                ⌨️ Press any other key to return to the Character selection !
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
    private func selectedTarget(target: Player) -> Character {
        print("")
        print("Select your target")
        for (index, character) in target.composition.enumerated() {
            if character.isDead() {
                print("🌑 RIP 💠 \(character.name) named \(character.alias) is Dead • ❌ Can't be a target !")
            } else {
                print("\(index) 💠 \(character.name) named \(character.alias) has \(character.life) HP" )
            }
        }
        if let value = readLine(), let choice = Int(value), choice <= target.composition.count - 1 {
            let selectATarget = target.composition[choice]
            print("🟢 A \(selectATarget.name) was selected !")
            print("")
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
    internal func hasLoose() -> Bool {
        if composition[0].isDead() && composition[1].isDead() && composition[2].isDead() {
            return true
        } else {
            return false
        }
    }
    
    // Print Stat of the Player
    internal func stats() {
        if self.hasLoose() {
            print("")
            print("❕ Looser Team \(name) composition was :")
            print("⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿")
            
        } else {
            print("")
            print("🎉 Winner Team \(name) composition was :")
            print("⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿⦿")
            
        }
        for (index, character) in composition.enumerated() {
            if character.isDead() {
                print("""
\(index) 🧙 : The \(character.name) call \(character.alias) is Dead 🌑
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
