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
    var allAlias: [String] = ["Ragnarsson", "Sheldon", "Hodor"]
    var composition: [Character] = [Character]()
    let limitCharacter = 3
    func createTeam(characters: [Character]) {
        var availableCharacters = characters
        print("""

Now the time has come to present your tribe, You're the \(name)
But who are your members and especially what are their roles?
A character has specific abilities, some can Attack 🤺 or Heal 💊.
""")
        while composition.count < limitCharacter {
            for (index, character) in availableCharacters.enumerated() {
                print("\(index) 🔸 \(character.name)", "            ⚛️ Abilities : \(character.ability)")
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
            if let value = readLine(), let choice = Int(value) {
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
                if allAlias.contains(newAlias) {
                    allAlias.append(newAlias)
                    print("""
                        ⚠️ Sorry but this person has already been introduced !

                        """)
                    allAlias.removeLast()
                    changeAlias(compo: .firstchoice)
                } else if newAlias.isEmpty {
                    allAlias.append(newAlias)
                    print("It's a \(composition[0].name) call \(composition[0].alias)")
                    composition[0].alias = newAlias
                } else {
                    allAlias.append(newAlias)
                    print("It's a \(composition[0].name) call \(newAlias)")
                    composition[0].alias = newAlias
                }
            }
        case .secondchoice:
            print("Choose a name for your \(composition[1].name) ✍️")
            if let newAlias = readLine() {
                if allAlias.contains(newAlias) {
                    allAlias.append(newAlias)
                    print("""
                        ⚠️ Sorry but this person has already been introduced !
                        """)
                    allAlias.removeLast()
                    changeAlias(compo: .secondchoice)
                } else if newAlias.isEmpty {
                    allAlias.append(newAlias)
                    print("It's a \(composition[1].name) call \(composition[1].alias)")
                    composition[1].alias = newAlias
                } else {
                    allAlias.append(newAlias)
                    print("It's a \(composition[1].name) call \(newAlias)")
                    composition[1].alias = newAlias
                }
            }
        case .lastchoice:
            print("Choose a name for your \(composition[2].name) ✍️")
            if let newAlias = readLine() {
                if allAlias.contains(newAlias) {
                    allAlias.append(newAlias)
                    print("""
                        ⚠️ Sorry but this person has already been introduced !

                        """)
                    allAlias.removeLast()
                    changeAlias(compo: .lastchoice)
                } else if newAlias.isEmpty {
                    allAlias.append(newAlias)
                    print("It's a \(composition[2].name) call \(composition[2].alias)")
                    composition[2].alias = newAlias
                } else {
                    allAlias.append(newAlias)
                    print("It's a \(composition[2].name) call \(newAlias)")
                    composition[2].alias = newAlias
                }
            }
        }
    }
    func playing() {
    }
    func isDead() -> Bool {
        if composition[0].life == 0 && composition[1].life == 0 && composition[2].life == 0 {
            game.endGame()
            return true
        } else {
            return false
        }
    }
}
