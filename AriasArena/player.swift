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
    static var allAlias: [String] = ["Ragnarsson"]
    var composition: [Character] = [Character]()
    let limitCharacter = 3
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
                composition.append(chooseACharacter)
                availableCharacters.remove(at: choice)
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
            print("Choose a name for your \(composition[0].name) ✍️")
            if let newAlias = readLine() {
                if Player.allAlias.contains(newAlias) {
                    Player.allAlias.append(newAlias)
                    print("""
                        ⚠️ Sorry but this person has already been introduced !

                        """)
                    Player.allAlias.removeLast()
                    changeAlias(compo: .firstchoice)
                } else if newAlias.isEmpty {
                    Player.allAlias.append(composition[0].alias)
                    print("It's a \(composition[0].name) call \(composition[0].alias)")
                    witchWeapon(compo: .firstchoice)
                } else {
                    Player.allAlias.append(newAlias)
                    print("It's a \(composition[0].name) call \(newAlias)")
                    composition[0].alias = newAlias
                    witchWeapon(compo: .firstchoice)
                }
            }
        case .secondchoice:
            print("Choose a name for your \(composition[1].name) ✍️")
            if let newAlias = readLine() {
                if Player.allAlias.contains(newAlias) {
                    Player.allAlias.append(newAlias)
                    print("""
                        ⚠️ Sorry but this person has already been introduced !
                        """)
                    Player.allAlias.removeLast()
                    changeAlias(compo: .secondchoice)
                } else if newAlias.isEmpty {
                    Player.allAlias.append(composition[1].alias)
                    print("It's a \(composition[1].name) call \(composition[1].alias)")
                    witchWeapon(compo: .secondchoice)
                } else {
                    Player.allAlias.append(newAlias)
                    print("It's a \(composition[1].name) call \(newAlias)")
                    composition[1].alias = newAlias
                    witchWeapon(compo: .secondchoice)
                }
            }
        case .lastchoice:
            print("Choose a name for your \(composition[2].name) ✍️")
            if let newAlias = readLine() {
                if Player.allAlias.contains(newAlias) {
                    Player.allAlias.append(newAlias)
                    print("""
                        ⚠️ Sorry but this person has already been introduced !

                        """)
                    Player.allAlias.removeLast()
                    changeAlias(compo: .lastchoice)
                } else if newAlias.isEmpty {
                    Player.allAlias.append(composition[2].alias)
                    print("It's a \(composition[2].name) call \(composition[2].alias)")
                    witchWeapon(compo: .lastchoice)
                } else {
                    Player.allAlias.append(newAlias)
                    print("It's a \(composition[2].name) call \(newAlias)")
                    composition[2].alias = newAlias
                    witchWeapon(compo: .lastchoice)
                }
            }
        }
    }
    
    func witchWeapon(compo: ChoiceCharacter) {
        switch compo {
        case .firstchoice:
            print("Witch weapon your \(composition[0].name) will use for this adventure ?")
            for (index, selectAWeapon) in composition[0].weaponType.enumerated() {
                if composition[0].canHeal {
                    print("\(index) 🔸 The \(selectAWeapon.type) > Damage: \(selectAWeapon.damage) Pts > Care: \(selectAWeapon.care) Pts")
                } else {
                    print("\(index) 🔸 The \(selectAWeapon.type) > Damage: \(selectAWeapon.damage) ")
                }
            }
            if let value = readLine(), let choice = Int(value), choice <= composition[0].weaponType.count - 1 {
                let choosenWeapon = composition[0].weaponType[choice]
                print("You choose The \(choosenWeapon.type) for \(composition[0].alias)")
                composition[0].weapon = choosenWeapon
            } else {
                witchWeapon(compo: .firstchoice)
            }
        case .secondchoice:
            print("Witch weapon your \(composition[1].name) will use for this adventure ?")
            for (index, selectAWeapon) in composition[1].weaponType.enumerated() {
                if composition[1].canHeal {
                    print("\(index) 🔸 The \(selectAWeapon.type) > Damage: \(selectAWeapon.damage) Pts > Care: \(selectAWeapon.care) Pts")
                } else {
                    print("\(index) 🔸 The \(selectAWeapon.type) > Damage: \(selectAWeapon.damage) ")
                }            }
            if let value = readLine(), let choice = Int(value), choice <= composition[1].weaponType.count - 1 {
                let choosenWeapon = composition[1].weaponType[choice]
                print("You choose The \(choosenWeapon.type) for \(composition[1].alias)")
                composition[1].weapon = choosenWeapon
            } else {
                witchWeapon(compo: .secondchoice)
            }
        case.lastchoice:
            print("Witch weapon your \(composition[2].name) will use for this adventure ?")
            for (index, selectAWeapon) in composition[2].weaponType.enumerated() {
                if composition[2].canHeal {
                    print("\(index) 🔸 The \(selectAWeapon.type) > Damage: \(selectAWeapon.damage) Pts > Care: \(selectAWeapon.care) Pts")
                } else {
                    print("\(index) 🔸 The \(selectAWeapon.type) > Damage: \(selectAWeapon.damage) ")
                }            }
            if let value = readLine(), let choice = Int(value), choice <= composition[2].weaponType.count - 1 {
                let choosenWeapon = composition[2].weaponType[choice]
                print("You choose The \(choosenWeapon.type) for \(composition[2].alias)")
                composition[2].weapon = choosenWeapon
            } else {
                witchWeapon(compo: .lastchoice)
            }
        }
    }
    
    func selectedCharacter(target: Player) -> Character {
        print("❗ \(name) you should select a companion ❗")
        for (index, character) in composition.enumerated() {
            if character.canAttack() {
                print("\(index) 🌀 \(character.name) named \(character.alias) as \(character.life) HP")
            } else if character.isDead() != hasLoose() {
                print("RIP 🌀 \(character.name) named \(character.alias) is Dead 🗿 ")
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
                    let currentTarget = selectedTarget(target: target)
                    currentPlayer.attack(target: currentTarget, weapon: currentPlayer.weapon)
                case "2":
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
            let currentTarget = selectedTarget(target: target)
            currentPlayer.attack(target: currentTarget, weapon: currentPlayer.weapon)
        }
    }
    
    func selectedTarget(target: Player) -> Character {
        print("""
Select your target
1 💠 \(target.composition[0].name) as \(target.composition[0].life) HP is Alive: \(target.composition[0].canAttack())
2 💠 \(target.composition[1].name) as \(target.composition[1].life) HP is Alive: \(target.composition[1].canAttack())
3 💠 \(target.composition[2].name) as \(target.composition[2].life) HP is Alive: \(target.composition[2].canAttack())
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
    
    func hasLoose() -> Bool {
        if composition[0].isDead() && composition[1].isDead() && composition[2].isDead() {
            game.endGame()
            return true
        } else {
            return false
        }
    }
}
