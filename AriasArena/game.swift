//
//  game.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

class Game {
    var round: Int = 1
    let player1: Player
    let player2: Player
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }
    
    func runGame() {
        let firstTeamLoose = player1.hasLoose()
        let secondTeamLoose = player2.hasLoose()
        while firstTeamLoose == false || secondTeamLoose == false {
            if round % 2 == 0 {
                print("🔴 \(player1.name) it's your turn")
                player1.fight(target: player2)
            } else if round % 2 == 1 {
                print("🔵 \(player2.name) it's your turn")
                player2.fight(target: player1)
            }
            round += 1
        }
        endGame()
    }
    
    func endGame() {
        print("End Game")
        if player1.hasLoose() {
            print("""
                The \(configuration.firstPlayer.name) lost the battle.
                Party is over
                """)
        } else {
            print("""
                The \(configuration.secondPlayer.name) lost the battle.
                Party is over
                """)
        }
    }
}
