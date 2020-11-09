//
//  Menu.swift
//  AriasArena
//
//  Created by Johann Ulma on 28/10/2020.
//

import Foundation

// Func General Menu
class Configuration {
    private var firstPlayer: Player?
    private var secondPlayer: Player?
//    var teamFirstPlayer = Player()
//    var teamSecondPlayer: Player?
    func showGeneral() {
        print("What do you want to do ?"
                + "\n1. 🕹️ 1 vs 1"
                + "\n2. ❓ How to play")
        if let menuChoice = readLine() {
            switch menuChoice {
            case "1":
                print("⚔️ We have a duel")
                firstPlayer = configureFirstPlayer()
                secondPlayer = configureSecondPlayer()
  //              teamFirstPlayer.createTeam()
 //               teamSecondPlayer?.createTeam()
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
            }
        }
    }
    // Func Intro Team Player1
    func configureFirstPlayer() -> Player {
        print("""

        Hello, adventurer, what is the name of your tribe?
        """)
        if let tribeNameP1 = readLine(), !tribeNameP1.isEmpty {
            print("""

        Well members of \(tribeNameP1) tribe.
        My name is Ragnarsson and I will escort you to the Arena of Arias.
        """)
            return Player(name: tribeNameP1)
        }
        print("""

        Well members of Guardians tribe.
        My name is Ragnarsson and I will escort you to the Arena of Arias.
        """)
        return Player(name: "Guardians")

    }
    // Func Intro Team Player 2
    func configureSecondPlayer() -> Player {
        print("""
                But first let me introduce you to your rivals of the day.
                What's the name of your tribe, already opponents?
                """)
        if let tribeNameP2 = readLine(), !tribeNameP2.isEmpty {
            print("""

        Yes that's right, the \(tribeNameP2) tribe.
        """)
            return Player(name: tribeNameP2)
        }
        print("""

    Yes that's right, The Saviors tribe.
    """)
        return Player(name: "Saviors")
    }
    // Function Build Teams
    func teamBuild() {
        print("""

        Now that the introductions are made, let's see who are your companions of fortune from the \(String(describing: firstPlayer?.name)) tribe.
        """)
        print("""
                    \(String(describing: firstPlayer?.name)) Leader: Before introducing myself, here are my two honourable companions.
            I present to you the famous (NameAlias), (Character) of his state.
            My second ally is a famous (Character) better known is the name of (NameAlias)
            Concerning me, I am (NameAlias) the (Character)
            """)
        print("Ragnarsson: A very interesting choice of companions, and who are the comrades of the tribe \(String(describing: secondPlayer?.name)) ?")
        print("""
                    \(String(describing: secondPlayer?.name)) Leader: Our fights are legendary but if you need to introduce us.
            I will also introduce myself after my comrades.
            Formerly known for his valiant fights in the greatest arenas of this world, here is (NameAlias) the (Character).
            It scours the world in search of new challengers here is the () that we call (NameAlias)
            And I am the danger, my name is (NameAlias) the (Character) !
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
            Now let's go to the fight

            """)
        configuration.showGeneral()
    }
    
}

