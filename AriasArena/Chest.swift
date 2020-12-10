//
//  Chest.swift
//  AriasArena
//
//  Created by Johann on 04/12/2020.
//

import Foundation

class Chest {
    
    func loot(current: Character) {
        let rollingDice = Int.random(in: 0...100)
        let bestWeapon =
            [Gridarvol(), Chanon(), Shadowmourne(), FangsFather(), BonnieClyde(), Artemis(), Anduril(), Mjollnir()]
        let badWeapon =
            [PieceOfWood(), Medieval(), Woodsman(), PlasticDagger(), WaterPistols(), PracticeBow(), Penknife(), Mallet()]
        var newWeaponList: [Weapon] = []
        
        if rollingDice >= 75 {
            print("""
Oh! 🎲 The dice of destiny have rolled. You have won this weapon, and it will replace your previous weapon.
""")
            if current.weaponType.count <= 2 {
                let firstType = bestWeapon.filter { $0.type == current.weaponType[0].type }
                let secondType = bestWeapon.filter { $0.type == current.weaponType[1].type }
                newWeaponList.append(contentsOf: firstType + secondType)
            } else {
                let firstType = bestWeapon.filter { $0.type == current.weaponType[0].type }
                let secondType = bestWeapon.filter { $0.type == current.weaponType[1].type }
                let lastType = bestWeapon.filter { $0.type == current.weaponType[2].type }
                newWeaponList.append(contentsOf: firstType + secondType + lastType)
            }
        } else if rollingDice <= 30 {
            print("""
Oh! 🎲 The dice of destiny have rolled. You have won this weapon, and it will replace your previous weapon.
""")
            if current.weaponType.count <= 2 {
                let firstType = badWeapon.filter { $0.type == current.weaponType[0].type }
                let secondType = badWeapon.filter { $0.type == current.weaponType[1].type }
                newWeaponList.append(contentsOf: firstType + secondType)
            } else {
                let firstType = badWeapon.filter { $0.type == current.weaponType[0].type }
                let secondType = badWeapon.filter { $0.type == current.weaponType[1].type }
                let lastType = badWeapon.filter { $0.type == current.weaponType[2].type }
                newWeaponList.append(contentsOf: firstType + secondType + lastType)
            }
        } else {
            newWeaponList.append(current.weapon)
        }
        
        let randomWeapon  = Int(arc4random_uniform(UInt32(newWeaponList.count)))
        let selectedWeapon = newWeaponList[randomWeapon]
        current.weapon = selectedWeapon
        if current.canHeal {
            print("""
                🔸 The new weapon is this \(current.weapon.type) named \(current.weapon.name)
                > Damage: \(current.weapon.damage) Pts > Care: \(current.weapon.care) Pts
                """)
        } else if newWeaponList.count == 1 {
        } else {
            print("""
                🔸 The new weapon is this \(current.weapon.type) named \(current.weapon.name)
                > Damage: \(current.weapon.damage)
                """)
        }
    }
}
