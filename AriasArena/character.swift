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
    var ability: String
    var life: Int
    var weapon: [Weapon]
    var canHeal: Bool
    init(name: String, alias: String, ability: String, life: Int, weapon: [Weapon], canHeal: Bool) {
        self.name = name
        self.alias = alias
        self.ability = ability
        self.life = life
        self.weapon = weapon
        self.canHeal = canHeal
    }
    func action() {
    }
    func state() {
        // received damage
        // received heal
    }
    func lifeUpdate () {
        print("Lost \(life) point")
    }
    func canAttack() -> Bool {
        return life > 0
        // si vie vie sup 0 on peut attaquer ou heal
    }
    func isDead() {
        while life > 0 {
            if life > 0 {
                // player can play
            } else if life == 0 {
            print("The \(name) named \(alias) is dead 🗿 ")
            }
        }
    }
}

// Character Witcher : Attack
class Witcher: Character {
    init() {
        let name = "Witcher"
        let alias = "Gerald"
        let ability = "🤺"
        let life = 600
        let weapon = [Sword(), Axe()]
        let canHeal = false
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Shan : Attack & Heal
class Shan: Character {
    init() {
        let name = "Shan"
        let alias = "Naco"
        let ability = "🤺 or 💊"
        let life = 300
        let weapon = [Sword(), Bow(), Hammer()]
        let canHeal = true
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Mystic : Attack & Heal
class Mystic: Character {
    init() {
        let name = "Mystic"
        let alias = "Raka"
        let ability = "🤺 or 💊"
        let life = 325
        let weapon = [Bow(), Dagger()]
        let canHeal = true
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character DemonHunter : Attack
class DemonHunter: Character {
    init() {
        let name = "Demon Hunter"
        let alias = "Kisa"
        let ability = "🤺"
        let life = 450
        let weapon = [Crossbow(), Pistols(), Bow()]
        let canHeal = false
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character DarthPriest : Attack & Heal
class DarthPriest: Character {
    init() {
        let name = "Darth Priest"
        let alias = "Magthael"
        let ability = "🤺 or 💊"
        let life = 350
        let weapon = [Stick(), Dagger()]
        let canHeal = true
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Mage : Attack
class Mage: Character {
    init() {
        let name = "Mage"
        let alias = "Gandalf"
        let ability = "🤺"
        let life = 400
        let weapon = [Stick(), Dagger()]
        let canHeal = false
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Nanga : Attack
class Nanga: Character {
    init() {
        let name = "Nanga"
        let alias = "Arthas"
        let ability = "🤺"
        let life = 600
        let weapon = [Hammer(), Axe(), Sword()]
        let canHeal = false
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}

// Character Scientist : Attack & Heal
class Scientist: Character {
    init() {
        let name = "Scientist"
        let alias = "Conor"
        let ability = "🤺 or 💊"
        let life = 425
        let weapon = [Pistols(), Bow()]
        let canHeal = true
        super.init(name: name, alias: alias, ability: ability, life: life, weapon: weapon, canHeal: canHeal)
    }
}
