//
//  character.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Character
class Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name
    }
    let name: String
    var alias: String
    var abilities: String
    var life: Int
    let weaponType: [Weapon]
    var weapon: Weapon
    var canHeal: Bool
    init(name: String, alias: String, abilities: String, life: Int, weaponType: [Weapon], weapon: Weapon, canHeal: Bool) {
        self.name = name
        self.alias = alias
        self.abilities = abilities
        self.life = life
        self.weaponType = weaponType
        self.weapon = weapon
        self.canHeal = canHeal
    }
    
    func attack (target: Character, weapon: Weapon) {
        target.life -= weapon.damage
        print("🤺 The \(self.name) made \(weapon.damage) points of damages to \(target.name)")
        if isDead() {
            print("The \(name) named \(alias) is dead 🗿 ")
        }
    }
    
    func healing (partner: Character, target: Character, weapon: Weapon) {
        partner.life += weapon.care
        print("💊 \(partner.name) healed \(target.name) and this one took back \(weapon.care) points of life")
    }
    
    func canAttack() -> Bool {
        return life > 0
        // si vie vie sup 0 on peut attaquer ou heal
    }
    
    func isDead() -> Bool {
        return life <= 0
    }
}

// Character Witcher : Attack
class Witcher: Character {
    init() {
        let name = "Witcher"
        let alias = "Gerald"
        let abilities = "🤺 ▫️ Life : 600 HP 🔹 Weapon choice : Sword, Axe"
        let life = 60 //600
        let weaponType = [Sword(), Axe()]
        let weapon = Sword()
        let canHeal = false
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}

// Character Shan : Attack & Heal
class Shan: Character {
    init() {
        let name = "Shan"
        let alias = "Naco"
        let abilities = "🤺 or 💊 ▫️ Life : 300 HP 🔹 Weapon choice : Sword, Bow, Hammer"
        let life = 30 //300
        let weaponType = [Sword(), Bow(), Hammer()]
        let weapon = Hammer()
        let canHeal = true
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}

// Character Mystic : Attack & Heal
class Mystic: Character {
    init() {
        let name = "Mystic"
        let alias = "Raka"
        let abilities = "🤺 or 💊 ▫️ Life : 325 HP 🔹 Weapon choice : Bow, Dagger"
        let life = 32 //325
        let weaponType = [Bow(), Dagger()]
        let weapon = Bow()
        let canHeal = true
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}

// Character DemonHunter : Attack
class DemonHunter: Character {
    init() {
        let name = "Demon Hunter"
        let alias = "Kisa"
        let abilities = "🤺 ▫️ Life : 450 HP 🔹 Weapon choice : Crossbow, Pistols, Bow"
        let life = 45 //450
        let weaponType = [Crossbow(), Pistols(), Bow()]
        let weapon = Crossbow()
        let canHeal = false
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}

// Character DarthPriest : Attack & Heal
class DarthPriest: Character {
    init() {
        let name = "Darth Priest"
        let alias = "Magthael"
        let abilities = "🤺 or 💊 ▫️ Life : 350 HP 🔹 Weapon choice : Stick, Dagger"
        let life = 35 //350
        let weaponType = [Stick(), Dagger()]
        let weapon = Dagger()
        let canHeal = true
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}

// Character Mage : Attack
class Mage: Character {
    init() {
        let name = "Mage"
        let alias = "Gandalf"
        let abilities = "🤺 ▫️ Life : 400 HP 🔹 Weapon choice : Stick, Dagger"
        let life = 40 //400
        let weaponType = [Stick(), Dagger()]
        let weapon = Stick()
        let canHeal = false
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}

// Character Nanga : Attack
class Nanga: Character {
    init() {
        let name = "Nanga"
        let alias = "Arthas"
        let abilities = "🤺 ▫️ Life : 600 HP 🔹 Weapon choice : Hammer, Axe, Sword"
        let life = 60 //600
        let weaponType = [Hammer(), Axe(), Sword()]
        let weapon = Axe()
        let canHeal = false
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}

// Character Scientist : Attack & Heal
class Scientist: Character {
    init() {
        let name = "Scientist"
        let alias = "Conor"
        let abilities = "🤺 or 💊 ▫️ Life : 425 HP 🔹 Weapon choice : Pistols, Bow"
        let life = 42 //420
        let weaponType = [Pistols(), Bow()]
        let weapon = Pistols()
        let canHeal = true
        super.init(name: name, alias: alias, abilities: abilities, life: life, weaponType: weaponType, weapon: weapon, canHeal: canHeal)
    }
}
