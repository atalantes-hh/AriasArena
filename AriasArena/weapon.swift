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
}

// Stick
class Stick: Weapon {
    init() {
        let name = "Shepherd's crook"
        let type = "Stick"
        let damage = 90
        let care = 60
        super.init(name: name, type: type, damage: damage, care: care)
    }
}
// Crossbow
class Crossbow: Weapon {
    init() {
        let name = "Tsangra"
        let type = "Crossbow"
        let damage = 115
        let care = 80
        super.init(name: name, type: type, damage: damage, care: care)
    }
}

// Axe
class Axe: Weapon {
    init() {
        let name = "Bardiche"
        let type = "Axe"
        let damage = 125
        let care = 90
        super.init(name: name, type: type, damage: damage, care: care)
    }
}

// Dagger
class Dagger: Weapon {
    init() {
        let name = "Medieval dagger"
        let type = "Dagger"
        let damage = 95
        let care = 40
        super.init(name: name, type: type, damage: damage, care: care)
    }
}

// Pistol
class Pistols: Weapon {
    init() {
        let name = "Higgins"
        let type = "Pistol"
        let damage = 110
        let care = 75
        super.init(name: name, type: type, damage: damage, care: care)
    }
}

// Bow
class Bow: Weapon {
    init() {
        let name = "Meerk"
        let type = "Bow"
        let damage = 100
        let care = 50
        super.init(name: name, type: type, damage: damage, care: care)
    }
}

// Sword
class Sword: Weapon {
    init() {
        let name = "Damo"
        let type = "Sword"
        let damage = 120
        let care = 80
        super.init(name: name, type: type, damage: damage, care: care)
    }
}

// Hammer
class Hammer: Weapon {
    init() {
        let name = "Mallet"
        let type = "Hammer"
        let damage = 130
        let care = 95
        super.init(name: name, type: type, damage: damage, care: care)
    }
}

func dice(character: Character) {
    let rollingDice = Int.random(in: 0...100)
    if rollingDice == 100 {
        print("\(rollingDice) perfect")
        // Best weapon in game
    } else if rollingDice >= 75 && rollingDice < 100 {
        print("\(rollingDice) good")
        // Enhanced Weapon
    } else if rollingDice <= 30 {
        print("\(rollingDice) bad")
        // Children Toy
    } else {
        // Continue game without changes
    }
}

func chest() {
//    let bestWeapon = classe de Weapon fille []
//    let boostWeapon =  classe de Weapon fille []
//    let kidWeapon = classe de Weapon fille []
//    if Character is Mage {
//        weaponType in les 3 tableaux
//    arc4random(tu tableau)
//    let newweapon = result arc4random
//    print("detail new weapon)
//     newweapon = character.weapon
//    }
}
