//
//  main.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

//
// MARK: - Conversation
//

print("""
Welcome to Arias

""")

let configuration = Configuration()
configuration.showGeneral()
let game = Game(player1: configuration.firstPlayer, player2: configuration.secondPlayer)
game.runGame()
game.endGame()
