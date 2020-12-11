//
//  Configuration.swift
//  AriasArena
//
//  Created by Johann Ulma on 28/10/2020.
//

import Foundation

// Func General Menu
class Configuration {
    private(set) var firstPlayer = Player()
    private(set) var secondPlayer = Player()
    private var availableCharacters =
        [Witcher(), Shan(), Mystic(), DemonHunter(), DarthPriest(), Mage(), Nanga(), Scientist()]
    // Function General Menu
    func showGeneral() {
        print("What do you want to do ?"
                + "\n1. 🕹️ 1 vs 1"
                + "\n2. ❓ How to play")
        if let menuChoice = readLine() {
            switch menuChoice {
            case "1":
                print("⚔️ We have a duel")
                configureFirstPlayer()
                configureSecondPlayer()
                teamBuild()
            case "2":
                print("📚 Game instructions")
                helpMode()
            default:
                print("""
                    Hum ! I'm sorry,
                    but I don't understand.
                    Can you repeat ?
                    """)
                while true {
                    configuration.showGeneral()
                }
            }
        }
    }
    
    // Func Introduction for Team Player1
    func configureFirstPlayer() {
        print("")
        print("Hello, adventurer, what is the name of your tribe?")
        if let tribeNameP1 = readLine(), !tribeNameP1.isEmpty {
            print("""

        Well members of \(tribeNameP1) tribe. 🔴
        My name is Ragnarsson and I will escort you to the Arena of Arias.
        Oh ! by the way, your color will be red ! 🔴
        """)
            firstPlayer.name = tribeNameP1
        } else {
            print("""

        Well members of Guardians tribe. 🔴
        My name is Ragnarsson and I will escort you to the Arena of Arias.
        Oh ! by the way, your color will be red ! 🔴
        """)
            firstPlayer.name = "Guardians"
        }
        firstPlayer.createTeam(characters: availableCharacters)
        firstPlayer.composition.forEach { (character) in
            if let index = availableCharacters.firstIndex(of: character) {
                availableCharacters.remove(at: index)
            }
        }
    }
    
    // Func Introduction for Team Player2
    func configureSecondPlayer() {
        print("""

                But first let me introduce you to your rivals of the day.
                What's the name of your tribe, already opponents? 🔵
                """)
        if let tribeNameP2 = readLine(), !tribeNameP2.isEmpty {
            if tribeNameP2 != firstPlayer.name {
                print("""

            Yes that's right, the \(tribeNameP2) tribe. 🔵
            And for you, your color will be blue ! 🔵
            """)
                secondPlayer.name = tribeNameP2
            } else {
                print("You cannot have the same name as your opponent of the day !")
                print("So let's try again.")
                configureSecondPlayer()
            }
        } else {
            print("""

    Yes that's right, The Saviors tribe. 🔵
    And for you, your color will be blue ! 🔵
    """)
            secondPlayer.name = "Saviors"
        }
        secondPlayer.createTeam(characters: availableCharacters)
        secondPlayer.composition.forEach { (character) in
            if let index = availableCharacters.firstIndex(of: character) {
                availableCharacters.remove(at: index)
            }
        }
    }
    
    // Function Build Teams Narration
    func teamBuild() {
        print("""
Now that the introductions are made, let's see who are your companions
of fortune from the \(firstPlayer.name) tribe. 🔴
""")
        print("""
🔴 \(firstPlayer.name) Mentor: I will introducing here are my tree honourable companions.
I present to you the famous \(firstPlayer.composition[0].alias), \(firstPlayer.composition[0].name) of his state.

My second ally is a famous \(firstPlayer.composition[1].name),
better known is the name of \(firstPlayer.composition[1].alias)

Concerning the last one, He's \(firstPlayer.composition[2].alias) the \(firstPlayer.composition[2].name)
""")
        print("""

Ragnarsson: A very interesting choice of companions, and who are the comrades of the tribe \(secondPlayer.name) ? 🔵
""")
        print("""
🔵 \(secondPlayer.name) Mentor: Our fights are legendary but if you need to introduce us.
Formerly known for his valiant fights in the greatest arenas of this world,
here is \(secondPlayer.composition[0].alias) the \(secondPlayer.composition[0].name).

It scours the world in search of new challengers here is the \(secondPlayer.composition[1].name)
that we call \(secondPlayer.composition[1].alias)

And the last he's the Danger, his name is \(secondPlayer.composition[2].alias) the \(secondPlayer.composition[2].name) !
""")
    }
    
    // Game Mode
    func helpMode() {
        print("""
            Arias Arena is a turn-based fight between two teams of 3 characters.
            At the beginning of the game each team leader chooses the name of his tribe and the members of his tribe.
            The first team that sees its 3 members reach 0 health points loses the fight.

            """)
        print("""
            First you choose your members.
            Then their names, if you have no idea a default name is assigned by pressing Enter ⌨️.
            And finally, their weapon in those available !
            """)
        print("""
            Now let's go to the fight

            """)
        configuration.showGeneral()
    }
}
