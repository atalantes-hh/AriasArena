//
//  Menu.swift
//  AriasArena
//
//  Created by Johann Ulma on 28/10/2020.
//

import Foundation

// Func General Menu
class Configuration {
    func showGeneral() {
        print("What do you want to do ?"
            + "\n1. 🕹️ 1 vs 1"
            + "\n2. ❓ How to play")
        
        if let menuChoice = readLine(){
            switch menuChoice {
            case "1":
                print("⚔️ We have a duel")
                configureFirstPlayer()
                configureSecondPlayer()
            case "2":
                print("📚 Game instructions")
            default:
                print("""
                    Hum ! I'm sorry,
                    but I don't understand.
                    Can you repeat ?
                    """)
            }
        }
    }
}
    
    // Func Intro Team Player1
    func configureFirstPlayer() {
        print("""

    Hello, adventurer, what is the name of your tribe?
    """)
        if let tribeNameP1 = readLine(), !tribeNameP1.isEmpty {
        print ("""

    Well members of \(tribeNameP1) tribe.
    My name is Ragnarsson and I will escort you to the Arena of Arias.
    """)
//            let player1 = Player(name: tribeNameP1) {
//             return Player
//    }
    }
    }
        // Func Intro Team Player 2
    func configureSecondPlayer() {
        print("""
    But first let me introduce you to your rivals of the day.
    What's the name of your tribe, already opponents?
    """)
        if let tribeNameP2 = readLine(), !tribeNameP2.isEmpty {
            print ("""

    Yes that's right, the \(tribeNameP2) tribe.

    """)
        }
    }

