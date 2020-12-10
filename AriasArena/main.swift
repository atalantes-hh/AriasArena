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

// Begin introdution
print("""
Welcome to Arias

""")
// Main actions to the game code
let configuration = Configuration()
configuration.showGeneral()
let game = Game(player1: configuration.firstPlayer, player2: configuration.secondPlayer)
game.runGame()
