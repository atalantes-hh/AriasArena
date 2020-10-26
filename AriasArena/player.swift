//
//  player.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

class Player {
    let name: String
    var play: Bool
    let composition : Character
    
    init(name: String, play: Bool, composition: Character){
        self.name = name
        self.play = play
        self.composition = composition
    }
    func playing () {
        if play == true {
            playing()
        } else {
            print("Next player")
        }
        
    }
    func choice (){
        
    }
}
