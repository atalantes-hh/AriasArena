//
//  character.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

class Character {
    let name: String
    var life: Int
    var weapon: Weapon
    
    init(name: String, life: Int, weapon:Weapon){
        self.name = name
        self.life = life
        self.weapon = weapon
        
    }
    func lifeupdate () {
        print("Lost \(life) point")
    }
}
