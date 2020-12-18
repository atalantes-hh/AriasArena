//
//  game.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Initialization of Game set with Configuration
final class Game {
    var round: Int = 1
    let player1: Player
    let player2: Player
    let chest = Chest()
    
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    // Start the Game and switch round between player 1 and 2
    func runGame() {
        var firstTeamLoose = player1.hasLoose()
        var secondTeamLoose = player2.hasLoose()
        while firstTeamLoose == false && secondTeamLoose == false {
            if round % 2 == 1 {
                print("🔴 \(player1.name) it's your turn")
                player1.fight(target: player2)
            } else if round % 2 == 0 {
                print("🔵 \(player2.name) it's your turn")
                player2.fight(target: player1)
            }
            round += 1
            firstTeamLoose = player1.hasLoose()
            secondTeamLoose = player2.hasLoose()
        }
        endGame()
    }
    
    // End Game : When a player loose display ending message and go to the statistics for each one.
    private func endGame() {
        print("🎮 End Game")
        if player1.hasLoose() {
            print("""
                The \(player1.name) lost the battle.
                Party is over after \(round) round.
                The winner team is \(player2.name) tribe !
                """)
        } else {
            print("""
                The \(player2.name) lost the battle.
                Party is over after \(round) round.
                The winner team is \(player1.name) tribe !
                """)
        }
        player1.stats()
        player2.stats()
    }
}
