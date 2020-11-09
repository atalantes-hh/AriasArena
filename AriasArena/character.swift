//
//  character.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Character
class Character {
    let name: String
    var life: Int
    var weapon: [Weapon]
    var canHeal: Bool
    init(name: String, life: Int, weapon: [Weapon], canHeal: Bool) {
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

// Character Witcher : Attack
class Witcher: Character {
    init() {
        let name = "Witcher"
        let life = 600
        let weapon = [Sword(), Axe()]
        let canHeal = false
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Shan : Attack & Heal
class Shan: Character {
    init() {
        let name = "Shan"
        let life = 300
        let weapon = [Sword(), Bow(), Hammer()]
        let canHeal = true
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Mystic : Attack & Heal
class Mystic: Character {
    init() {
        let name = "Mystic"
        let life = 325
        let weapon = [Bow(), Dagger()]
        let canHeal = true
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character DemonHunter : Attack
class DemonHunter: Character {
    init() {
        let name = "Demon hunter"
        let life = 450
        let weapon = [Crossbow(), Pistols(), Bow()]
        let canHeal = false
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character DarthPriest : Attack & Heal
class DarthPriest: Character {
    init() {
        let name = "Darth Priest"
        let life = 350
        let weapon = [Stick(), Dagger()]
        let canHeal = true
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Mage : Attack
class Mage: Character {
    init() {
        let name = "Mage"
        let life = 400
        let weapon = [Stick(), Dagger()]
        let canHeal = false
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Nanga : Attack
class Nanga: Character {
    init() {
        let name = "Nanga"
        let life = 600
        let weapon = [Hammer(), Axe(), Sword()]
        let canHeal = false
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Scientist : Attack & Heal
class Scientist: Character {
    init() {
        let name = "Shan"
        let life = 425
        let weapon = [Pistols(), Bow()]
        let canHeal = true
        super.init(name: name, life: life, weapon: weapon, canHeal: canHeal)
    }
}
