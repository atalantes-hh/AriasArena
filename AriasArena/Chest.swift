//
//  Chest.swift
//  AriasArena
//
//  Created by Johann on 04/12/2020.
//

import Foundation

class Chest {
    
    func loot(current: Character) {
        let newWeaponList = getWeaponList(current: current)
        guard !newWeaponList.isEmpty else { return }
        
        let randomWeapon  = Int(arc4random_uniform(UInt32(newWeaponList.count)))
        let selectedWeapon = newWeaponList[randomWeapon]
        current.weapon = selectedWeapon
        if current.canHeal {
            print("""
                🔸 The new weapon is this \(current.weapon.gender) named \(current.weapon.name)
                > Damage: \(current.weapon.damage) Pts > Care: \(current.weapon.care) Pts
                """)
        } else {
            print("""
                🔸 The new weapon is this \(current.weapon.gender) named \(current.weapon.name)
                > Damage: \(current.weapon.damage)
                """)
        }
    }
    
    func getWeaponList(current: Character) -> [Weapon] {
        let rollingDice = Int.random(in: 0...100)
        let bestWeapon =
            [Gridarvol(), Chanon(), Shadowmourne(), FangsFather(), BonnieClyde(), Artemis(), Anduril(), Mjollnir()]
        let badWeapon =
            [PieceOfWood(), Medieval(), Woodsman(), PlasticDagger(), WaterPistol(), PracticeBow(), Penknife(), Mallet()]
        var newWeaponList: [Weapon] = []
        
        if rollingDice >= 75 {
            print("""
Oh! 🎲 The dice of destiny have rolled. You have won this weapon, and it will replace your previous weapon.
""")
            newWeaponList = current.weaponGender.map { weapon in
                return bestWeapon.filter { $0.gender == weapon.gender }
            }.reduce([], +)
        } else if rollingDice <= 30 {
            print("""
Oh! 🎲 The dice of destiny have rolled. You have won this weapon, and it will replace your previous weapon.
""")
            newWeaponList = current.weaponGender.map { weapon in
                return badWeapon.filter { $0.gender == weapon.gender }
            }.reduce([], +)
        }
        return newWeaponList
    }
}
