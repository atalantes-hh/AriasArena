//
//  main.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Begin introdution
print("Welcome to Arias 🏔")
print("")

// Main actions to the game : Hearth of the game who lauch the configuration and the game
let configuration = Configuration()
configuration.showGeneral()
let game = Game(player1: configuration.firstPlayer, player2: configuration.secondPlayer)
game.runGame()
