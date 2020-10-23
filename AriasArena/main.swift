//
//  main.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

//
// MARK - Parameters
//

func generalMenu() {
    print("What do you want to do ?"
        + "\n1. 🕹️ 1 vs 1"
        + "\n2. ❓ How to play")
    
    if let genderChoice = readLine(){
        switch genderChoice {
        case "1":
            print("⚔️ Duel")
        case "2":
            print("📚 Help Mode")
        default:
            print("""
                Hum ! I'm sorry,
                but I don't understand.
                Can you repeat ?
                """)
        }
    }
}
// Func General Menu



func tribeP1() {
    print("""

Hello, adventurer, what is the name of your tribe?
""")
    if let tribeNameP1 = readLine(){
    print ("""

Well members of \(tribeNameP1) tribe.
My name is Ragnarsson and I will escort you to the Arena of Arias.
""")
}
}
// Func Intro Team Player1

func tribeP2() {
    print("""
But first let me introduce you to your rivals of the day.
What's the name of your tribe, already opponents?
""")
    if let tribeNameP2 = readLine(){
        print ("""

Yes that's right, the \(tribeNameP2) tribe.

""")
    }
}
// Func Intro Team Player 2


//
// MARK - Conversation
//

print("""
Welcome to Arias

""")

generalMenu()
tribeP1()
tribeP2()

