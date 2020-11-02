//
//  weapon.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

class Weapon {
    let name: String
    let type: String
    let damage: Int
    let care: Int
    
    init(name: String, type: String, damage: Int, care: Int) {
        self.name = name
        self.type = type
        self.damage = damage
        self.care = care
    }
    func attack () {
        print("Make \(damage) points damages")
    }
    func healing () {
        print("Healing for \(care) points")
    }
}
