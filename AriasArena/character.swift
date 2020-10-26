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
    var canAttack: Bool
    
    init(name: String, life: Int, weapon:Weapon, canHeal: Bool, canAttack: Bool){
        self.name = name
        self.life = life
        self.weapon = weapon
        self.canHeal = canHeal
        self.canAttack = canAttack
    }
    func action() {
        
    }
    func lifeupdate () {
        print("Lost \(life) point")
    }
}
