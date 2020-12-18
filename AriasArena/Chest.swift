//
//  Chest.swift
//  AriasArena
//
//  Created by Johann on 04/12/2020.
//

import Foundation

// Class Bonus Weapon Loot ( Upgrade of Downgrade for Chracter Weapon )
final class Chest {
    
    // Function to check if Dice is in range else return to fight
    func loot(current: Character) {
        let newWeaponList = getWeaponList(current: current)
        guard !newWeaponList.isEmpty else { return }
        
        let randomWeapon  = Int(arc4random_uniform(UInt32(newWeaponList.count)))
        let selectedWeapon = newWeaponList[randomWeapon]
        current.weapon = selectedWeapon
        
        // If character can heal display new Care points
        if current.canHeal {
            print("""
                🔸 The new weapon is this \(current.weapon.gender) named \(current.weapon.name)
                🔹 Damage: \(current.weapon.damage) Pts 🔹 Care: \(current.weapon.care) Pts
                """)
            print("")
            
            // Else just display Damages
        } else {
            print("""
                🔸 The new weapon is this \(current.weapon.gender) named \(current.weapon.name)
                🔹 Damage: \(current.weapon.damage)
                """)
            print("")
        }
    }
    
    // Rolling a Dice to obtain a new weapon or not
    private func getWeaponList(current: Character) -> [Weapon] {
        let rollingDice = Int.random(in: 0...100)
        let bestWeapon =
            [Gridarvol(), Chanon(), Shadowmourne(), FangsFather(), BonnieClyde(), Artemis(), Anduril(), Mjollnir()]
        let badWeapon =
            [PieceOfWood(), Medieval(), Woodsman(), PlasticDagger(), WaterPistol(), PracticeBow(), Penknife(), Mallet()]
        var newWeaponList: [Weapon] = []
        
        // If rolling >= 75 : Get a better Weapon
        if rollingDice >= 75 {
            print("")
            print("""
                    Oh! 🎲 The dice of destiny have rolled.
                    A chest appeared, you have won a new weapon,
                    and it will replace your previous weapon \(current.weapon.name) !
                    """)
            
            /* For the active character, we list his available weaponGender and filter the weapons
             in bestWeapon array.
             We only select the bestWeapon Gender that matches the active character's WeaponGender.
             Then we created a newWeaponList with this selection.
             **/
            let filterGender = current.weaponGender.map { weapon in
                return bestWeapon.filter { $0.gender == weapon.gender }
            }
            newWeaponList = Array(filterGender.joined())
            
            // If rolling <= 30 : Get a bad Weapon
        } else if rollingDice <= 30 {
            print("")
            print("""
                    Oh! 🎲 The dice of destiny have rolled.
                    A chest appeared, you have won a new weapon,
                    and it will replace your previous weapon \(current.weapon.name) !
                    """)
            
            /* For the active character, we list his available weaponGender and filter the weapons
             in badWeapon array.
             We only select the badWeapon Gender that matches the active character's WeaponGender.
             Then we created a newWeaponList with this selection.
             **/
            let filterGender = current.weaponGender.map { weapon in
                return badWeapon.filter { $0.gender == weapon.gender }
            }
            newWeaponList = Array(filterGender.joined())
        }
        return newWeaponList
    }
}
