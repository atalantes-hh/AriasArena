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
    var canHeal: Bool
    
    init(name: String, life: Int, weapon: Weapon, canHeal: Bool) {
        self.name = name
        self.life = life
        self.weapon = weapon
        self.canHeal = canHeal

    }
    
    func action() {
    }
    
    func lifeUpdate () {
        print("Lost \(life) point")
    }
    
    func canAttack() -> Bool {
        return life > 0
    }
}
