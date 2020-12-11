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
    var startLife: Int
    var life: Int
    let weaponGender: [Weapon]
    var weapon: Weapon
    var canHeal: Bool
    
    init(
        name: String,
        alias: String,
        abilities: String,
        startLife: Int,
        life: Int,
        weaponGender: [Weapon],
        weapon: Weapon,
        canHeal: Bool
    ) {
        self.name = name
        self.alias = alias
        self.abilities = abilities
        self.startLife = startLife
        self.life = life
        self.weaponGender = weaponGender
        self.weapon = weapon
        self.canHeal = canHeal
    }
    // Function to change Alias before game start after choose a character
    func changeAlias() {
        print("Choose a name for your \(self.name) ✍️")
        if let newAlias = readLine() {
            if Player.allAlias.contains(newAlias) {
                Player.allAlias.append(newAlias)
                print("""
                        ⚠️ Sorry but this person has already been introduced !

                        """)
                Player.allAlias.removeLast()
            } else if newAlias.isEmpty {
                Player.allAlias.append(alias)
                print("It's a \(name) call \(alias)")
                witchWeapon()
            } else {
                Player.allAlias.append(newAlias)
                print("It's a \(name) call \(newAlias)")
                alias = newAlias
                witchWeapon()
            }
        }
    }
    // Function to choice a Weapon before game start after choose a character
    func witchWeapon() {
        print("Witch weapon your \(name) will use for this adventure ?")
        for (index, selectAWeapon) in weaponGender.enumerated() {
            if canHeal {
print("\(index) 🔸 The \(selectAWeapon.gender) > Damage: \(selectAWeapon.damage) Pts > Care: \(selectAWeapon.care) Pts")
            } else {
                print("\(index) 🔸 The \(selectAWeapon.gender) > Damage: \(selectAWeapon.damage) ")
            }
        }
        if let value = readLine(), let choice = Int(value), choice <= weaponGender.count - 1 {
            let choosenWeapon = weaponGender[choice]
            print("You choose The \(choosenWeapon.gender) for \(alias)")
            weapon = choosenWeapon
        } else {
            witchWeapon()
        }
    }
    // Function to Attack a character in the other team
    func attack(target: Character, weapon: Weapon) {
        target.life -= weapon.damage
        print("🤺 The \(self.name) made \(weapon.damage) points of damages to \(target.name)")
        if isDead() {
            print("The \(name) named \(alias) is dead 🗿 ")
        }
    }
    // Function to Healing a charcter in your team
    func healing(partner: Character, target: Character, weapon: Weapon) {
        partner.life += weapon.care
        print("💊 \(partner.name) healed \(target.name) and this one took back \(weapon.care) points of life")
    }
    // Display character who can play
    func canAttack() -> Bool {
        return life > 0
        // si vie vie sup 0 on peut attaquer ou heal
    }
    // Display when character is dead
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
        let startLife = 60 //600
        let life = 60 //600
        let weaponGender = [Sword(), Axe()]
        let weapon = Sword()
        let canHeal = false
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
// Character Shan : Attack & Heal
class Shan: Character {
    init() {
        let name = "Shan"
        let alias = "Naco"
        let abilities = "🤺 or 💊 ▫️ Life : 300 HP 🔹 Weapon choice : Sword, Bow, Hammer"
        let startLife = 30 //300
        let life = 30 //300
        let weaponGender = [Sword(), Bow(), Hammer()]
        let weapon = Hammer()
        let canHeal = true
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
// Character Mystic : Attack & Heal
class Mystic: Character {
    init() {
        let name = "Mystic"
        let alias = "Raka"
        let abilities = "🤺 or 💊 ▫️ Life : 325 HP 🔹 Weapon choice : Bow, Dagger"
        let startLife = 32 //325
        let life = 32 //325
        let weaponGender = [Bow(), Dagger()]
        let weapon = Bow()
        let canHeal = true
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
// Character DemonHunter : Attack
class DemonHunter: Character {
    init() {
        let name = "Demon Hunter"
        let alias = "Kisa"
        let abilities = "🤺 ▫️ Life : 450 HP 🔹 Weapon choice : Crossbow, Pistol, Bow"
        let startLife = 45 //450
        let life = 45 //450
        let weaponGender = [Crossbow(), Pistol(), Bow()]
        let weapon = Crossbow()
        let canHeal = false
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
// Character DarthPriest : Attack & Heal
class DarthPriest: Character {
    init() {
        let name = "Darth Priest"
        let alias = "Magthael"
        let abilities = "🤺 or 💊 ▫️ Life : 350 HP 🔹 Weapon choice : Stick, Dagger"
        let startLife = 35 //350
        let life = 35 //350
        let weaponGender = [Stick(), Dagger()]
        let weapon = Dagger()
        let canHeal = true
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
// Character Mage : Attack
class Mage: Character {
    init() {
        let name = "Mage"
        let alias = "Gandalf"
        let abilities = "🤺 ▫️ Life : 400 HP 🔹 Weapon choice : Stick, Dagger"
        let startLife = 40 //400
        let life = 40 //400
        let weaponGender = [Stick(), Dagger()]
        let weapon = Stick()
        let canHeal = false
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
// Character Nanga : Attack
class Nanga: Character {
    init() {
        let name = "Nanga"
        let alias = "Arthas"
        let abilities = "🤺 ▫️ Life : 600 HP 🔹 Weapon choice : Hammer, Axe, Sword"
        let startLife = 60 //600
        let life = 60 //600
        let weaponGender = [Hammer(), Axe(), Sword()]
        let weapon = Axe()
        let canHeal = false
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
// Character Scientist : Attack & Heal
class Scientist: Character {
    init() {
        let name = "Scientist"
        let alias = "Conor"
        let abilities = "🤺 or 💊 ▫️ Life : 425 HP 🔹 Weapon choice : Pistol, Bow"
        let startLife = 42 //420
        let life = 42 //420
        let weaponGender = [Pistol(), Bow()]
        let weapon = Pistol()
        let canHeal = true
        super.init(name: name,
                   alias: alias,
                   abilities: abilities,
                   startLife: startLife,
                   life: life,
                   weaponGender: weaponGender,
                   weapon: weapon,
                   canHeal: canHeal)
    }
}
