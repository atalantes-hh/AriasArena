//
//  game.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

class Game {
    var round: Int = 0
    let player1: Player
    let player2: Player
//    var lifePlayer1: Int
//    var lifePlayer2: Int
    init(player1: Player, player2: Player) {
        self.player1 = player1
        self.player2 = player2
    }

    func runGame() {
        let firstTeamExist = player1.composition.count > 0
        let secondTeamExist = player2.composition.count > 0
        while (firstTeamExist && secondTeamExist) && round <= 100 {
                round += 1
                if round % 2 == 1 {
                    print(" 🔴 \(player1.name) it's your turn \(round)")
                    } else if round % 2 == 0 {
                        print("🔵 \(player2.name) it's your turn \(round)")
                    } else if (firstTeamExist == false || secondTeamExist == false ) || round == 100 {
                        endGame()
                    }
            }
        }
    func endGame() {
        print("End Game")
    }
}
