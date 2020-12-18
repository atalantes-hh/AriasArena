//
//  Configuration.swift
//  AriasArena
//
//  Created by Johann Ulma on 28/10/2020.
//

import Foundation

// Function Configuration : Lauch of Players
final class Configuration {
    private(set) var firstPlayer = Player()
    private(set) var secondPlayer = Player()
    private var availableCharacters =
        [Witcher(), Shan(), Mystic(), DemonHunter(), DarthPriest(), Mage(), Nanga(), Scientist()]
    private var availableWeapons =
        [Stick(), Crossbow(), Axe(), Dagger(), Pistol(), Bow(), Sword(), Hammer()]
    
    // Function General Menu : Game Mode or Help Mode
    func showGeneral() {
        print("")
        print("▶︎ Main Menu"
                + "\n1. 🕹️ Game Mode : 1 vs 1"
                + "\n2. ❓ How to play")
        print("❕ If you play for the first time, it's better to read the Game instructions")
        print("")
        print("What do you want to do ?")
        
        if let menuChoice = readLine() {
            switch menuChoice {
            case "1":
                print("⚔️ We have a duel")
                configureFirstPlayer()
                teamBuild(team: .teamPlayer1)
                configureSecondPlayer()
                teamBuild(team: .teamPlayer2)
                explainLife()
            case "2":
                print("📚 Game instructions")
                helpMode()
            default:
                print("""
                    Hum ! I'm sorry,
                    but I don't understand.
                    Can you repeat ?
                    """)
                print("")
                configuration.showGeneral()
            }
        }
    }
    
    // Function Introduction for Team Player1 : Choice a Tribe Name
    private func configureFirstPlayer() {
        print("")
        print("🧔 Hello, adventurer, what is the name of your tribe?")
        print("If you don't have any idea just press Enter ⌨️")
        
        if let tribeNameP1 = readLine(), !tribeNameP1.isEmpty {
            firstPlayer.name = tribeNameP1
        } else {
            firstPlayer.name = "Guardians"
        }
        
        print("")
        print("""
                Well members of \(firstPlayer.name) tribe. 🔴
                🧔 My name is Ragnarsson and I will escort you to the Arena of Arias.
                Oh ! by the way, your color will be red ! 🔴
                """)
        
        // For the creation of the team, we go through the array availableCharacters
        // and when a character is chosen it is remove from it.
        firstPlayer.createTeam(characters: availableCharacters)
        firstPlayer.composition.forEach { (character) in
            if let index = availableCharacters.firstIndex(of: character) {
                availableCharacters.remove(at: index)
            }
        }
    }
    
    // Function Introduction for Team Player2 : Choice a Tribe Name
    private func configureSecondPlayer() {
        print("")
        print("""
                🧔 But first let me introduce you to your rivals of the day.
                What's the name of your tribe, already opponents?
                """)
        print("If you don't have any idea just press Enter ⌨️")
        
        // Name of the team can't be the same as the first team
        if let tribeNameP2 = readLine(), !tribeNameP2.isEmpty {
            if tribeNameP2 != firstPlayer.name {
                secondPlayer.name = tribeNameP2
            } else {
                print("You cannot have the same name as your opponent of the day !")
                print("So let's try again.")
                configureSecondPlayer()
            }
        } else {
            secondPlayer.name = "Saviors"
        }
        print("")
        print("""
                🧔 Yes that's right, the \(secondPlayer.name) tribe. 🔵
                And for you, your color will be blue ! 🔵
                """)
        
        // For the creation of the team, we go through the array availableCharacters
        // and when a character is chosen it is remove from it.
        secondPlayer.createTeam(characters: availableCharacters)
        secondPlayer.composition.forEach { (character) in
            if let index = availableCharacters.firstIndex(of: character) {
                availableCharacters.remove(at: index)
            }
        }
    }
    
    // Enumeration to choice Build Teams Narration
    private enum PlayerBuild {
        case teamPlayer1, teamPlayer2
    }
    
    // Function Build Teams Narration to RPG Introduction of each team
    private func teamBuild(team: PlayerBuild) {
        if team == .teamPlayer1 {
            print("""
                Now that the introductions are made, let's see who are your companions
                of fortune from the \(firstPlayer.name) tribe. 🔴
                """)
            print("""
                🔴 \(firstPlayer.name) Mentor: I will introducing here are my tree honourable companions.
                I present to you the famous \(firstPlayer.composition[0].alias),
                \(firstPlayer.composition[0].name) of his state.

                My second ally is a famous \(firstPlayer.composition[1].name),
                better known is the name of \(firstPlayer.composition[1].alias)

                Concerning the last one, He's \(firstPlayer.composition[2].alias) the \(firstPlayer.composition[2].name)
                """)
            print("")
            print("🧔 Ragnarsson: A very interesting choice of companions !")
            
        } else if team == .teamPlayer2 {
            print(" And who are the comrades of the tribe \(secondPlayer.name) ?")
            print("""
                🔵 \(secondPlayer.name) Mentor: Our fights are legendary but if you need to introduce us.
                Formerly known for his valiant fights in the greatest arenas of this world,
                here is \(secondPlayer.composition[0].alias) the \(secondPlayer.composition[0].name).

                It scours the world in search of new challengers here is the \(secondPlayer.composition[1].name)
                that we call \(secondPlayer.composition[1].alias)

                And the last he's the Danger ...
                His name is \(secondPlayer.composition[2].alias) the \(secondPlayer.composition[2].name) !
                """)
            print("")
            print("🧔 It promises to be a memorable battle!")
        }
    }
    
    // Function Explain Life visual concept
    private func explainLife() {
        print("")
        print("🧔 Oh ! One last thing, your character life is like the Sun 🔆 and the Moon 🌕.")
        print("All along the battle, it will evolve according to your level of life.")
        print("""
            If your life is at its maximum you will have a Sun 🔆
            As long as this one is at 3 quarter of its initial level your Moon will be full 🌕
            Between the half of life and the 3 quarter, your crescent Moon will begin to blacken 🌖
            After half your life is displayed as a Half Moon 🌗
            Below the quarter of life, there will be only one crescent Moon left 🌘
            And finally when life will be gone you Moon will be a Dark Moon 🌑
            """)
        print("")
        print("Now let's go to fight !")
    }
    
    // Game Mode : Explain the Game
    private func helpMode() {
        print("""
            Arias Arena is a turn-based fight between two teams of 3 characters.
            At the beginning of the game each team leader chooses the name of his tribe and the members of his tribe.
            If you have no idea a default tribe name is assigned by pressing Enter ⌨️.
            The first team that sees its 3 members reach 0 health points loses the fight.
            """)
        print("")
        print("""
            First you choose your members.
            Each character has their own abilities.
            Some can attack or heal and others can only attack.
            They also have some type of weapons they can use.
            """)
        print("""
            Then a character is choose, you will  assigne a name.
            If you have no idea a default name is assigned by pressing Enter ⌨️.
            And finally, you choice their weapon in those available !
            """)
        print("This is a short introduction for the characters.")
        print("You will see their own abilities, life and weapon gender.")
        print("")
        print("Character abilities : some can Attack ⚔️ or Heal 💊.")
        
        // Listing Characters available and abilities (Life, Weapon, Attack and Healing case)
        for (index, character) in availableCharacters.enumerated() {
            print("\(index) 🔸 \(character.name)")
            print("⚛️ Abilities : \(character.abilities)")
        }
        print("")
        print("And the weapon specificities")
        // Listing Weapons Type available (Name, Damages, Care)
        print("❕ Care Points ⛑ will active only for the healer character")
        
        // Listing Weapons available and specificities (Damage, Care)
        for (index, weapon) in availableWeapons.enumerated() {
            print("\(index) 🔸 \(weapon.gender) 🔸 Named \(weapon.name)")
            print("         🔹 Damage: \(weapon.damage) Pts 🔹 Care: \(weapon.care) Pts")
        }
        print("")
        print("🧔 In this worldm ysterious things can happen ...")
        print("Now let's go to the game 🕹️")
        print("")
        
        configuration.showGeneral()
    }
    
    // Function Ending Menu :
    func endingMenu() {
        print("")
        print("🧔 That was a great battle")
        print("Do you want to play again ?")
        print("")
        print("▶︎ Ending Menu"
                + "\n1. New Game "
                + "\n2. Display Last Game Stats and Exit"
                + "\n3. Exit Game")
        print("")
        print("What do you want to do ?")
        
        if let menuChoice = readLine() {
            switch menuChoice {
            case "1":
                showGeneral()
            case "2":
                game.player1.stats()
                game.player2.stats()
                print("🖖 Bye ! See you later in Arias World 🏔")
                exit(0)
            case "3":
                print("🖖 Bye ! See you later in Arias World 🏔")
                exit(0)
            default:
                print("Press 1 to Play Again")
                print("Press 2 to Exit")
                print("")
                endingMenu()
            }
        }
    }
}
