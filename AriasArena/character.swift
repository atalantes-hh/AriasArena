//
//  character.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Character : Define the Features of each character
class Character: Equatable {
    
    // Compare Character in each team
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name
    }
    
    let name: String
    var alias: String
    let startLife: Int
    var life: Int
    let weaponGender: [Weapon]
    var weapon: Weapon
    var canHeal: Bool
    var abilities: String
    
    init(
        name: String,
        alias: String,
        startLife: Int,
        life: Int,
        weaponGender: [Weapon],
        weapon: Weapon,
        canHeal: Bool,
        abilities: String
    ) {
        self.name = name
        self.alias = alias
        self.startLife = startLife
        self.life = life
        self.weaponGender = weaponGender
        self.weapon = weapon
        self.canHeal = canHeal
        self.abilities = abilities
    }
    
    // Function to change Alias before game start after choose a character, by default a name exist for each character.
    func changeAlias() {
        print("Choose a name for your \(self.name) ✍️")
        print("If you don't have any idea just press Enter ⌨️")
        if let newAlias = readLine() {
            if Player.allAlias.contains(newAlias) {
                Player.allAlias.append(newAlias)
                print("⚠️ Sorry but this person has already been introduced !")
                print("")
                Player.allAlias.removeLast()
                changeAlias()
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
        print("")
        print("Ok, and witch weapon your \(name) will use for this adventure ?")
        
        // Listing all weapon Gender for the character
        for (index, selectAWeapon) in weaponGender.enumerated() {
            if canHeal {
                print("\(index) 🔸 The \(selectAWeapon.gender)")
                print("              🔹 Damage: \(selectAWeapon.damage) Pts 🔹 Care: \(selectAWeapon.care) Pts")
            } else {
                print("\(index) 🔸 The \(selectAWeapon.gender)")
                print("              🔹 Damage: \(selectAWeapon.damage) Pts")
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
    }
    
    // Function to Healing a charcter in your own team
    func healing(partner: Character, target: Character, weapon: Weapon) {
        partner.life += weapon.care
        if partner.life >= partner.startLife {
            partner.life = partner.startLife
            print("💊 \(partner.name) healed \(target.name) and this one took back is initial points of life")
        } else {
            print("💊 \(partner.name) healed \(target.name) and this one took back \(weapon.care) points of life")
        }
    }
    
    //  To act when the character is dead
    func isDead() -> Bool {
        return life <= 0
    }
}

// Character Witcher : A Melee Fighter
final class Witcher: Character {
    init() {
        let name = "Witcher"
        let alias = "Gerald"
        let startLife = 500
        let life = startLife
        let weaponGender = [Sword(), Axe()]
        let weapon = weaponGender.first!
        let canHeal = false
        let abilities = "⚔️ ▫️ Life : \(startLife) HP 🔹 Weapon available : Sword, Axe"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}

// Character Shan : A Melee Fighter and Healing with the power of the Earth Elements
final class Shan: Character {
    init() {
        let name = "Shan"
        let alias = "Naco"
        let startLife = 280
        let life = startLife
        let weaponGender = [Sword(), Bow(), Hammer()]
        let weapon = weaponGender.first!
        let canHeal = true
        let abilities = "⚔️ or 💊 ▫️ Life : \(startLife) HP 🔹 Weapon available : Sword, Bow, Hammer"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}

// Character Mystic : A Ranged Fighter and Healing with the power of the Nature
final class Mystic: Character {
    init() {
        let name = "Mystic"
        let alias = "Raka"
        let startLife = 290
        let life = startLife
        let weaponGender = [Bow(), Dagger()]
        let weapon = weaponGender.first!
        let canHeal = true
        let abilities = "⚔️ or 💊 ▫️ Life : \(startLife) HP 🔹 Weapon available : Bow, Dagger"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}

// Character DemonHunter : A Ranged Fighter
final class DemonHunter: Character {
    init() {
        let name = "Demon Hunter"
        let alias = "Kisa"
        let startLife = 350
        let life = startLife
        let weaponGender = [Crossbow(), Pistol(), Bow()]
        let weapon = weaponGender.first!
        let canHeal = false
        let abilities = "⚔️ ▫️ Life : \(startLife) HP 🔹 Weapon available : Crossbow, Pistol, Bow"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}

// Character DarthPriest : A Ranged Fighter and Healing with the power of the Darth Matter
final class DarthPriest: Character {
    init() {
        let name = "Darth Priest"
        let alias = "Magthael"
        let startLife = 300
        let life = startLife
        let weaponGender = [Stick(), Dagger(), Sword()]
        let weapon = weaponGender.first!
        let canHeal = true
        let abilities = "⚔️ or 💊 ▫️ Life : \(startLife) HP 🔹 Weapon available : Stick, Dagger, Sword"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}

// Character Mage : A Ranged Fighter
final class Mage: Character {
    init() {
        let name = "Mage"
        let alias = "Gandalf"
        let startLife = 340
        let life = startLife
        let weaponGender = [Stick(), Dagger()]
        let weapon = weaponGender.first!
        let canHeal = false
        let abilities = "⚔️ ▫️ Life : \(startLife) HP 🔹 Weapon available : Stick, Dagger"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}

// Character Nanga : A Melee Fighter
final class Nanga: Character {
    init() {
        let name = "Nanga"
        let alias = "Arthas"
        let startLife = 490
        let life = startLife
        let weaponGender = [Hammer(), Axe(), Sword()]
        let weapon = weaponGender.first!
        let canHeal = false
        let abilities = "⚔️ ▫️ Life : \(startLife) HP 🔹 Weapon available : Hammer, Axe, Sword"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}

// Character Scientist : A Ranged Fighter and Healing with the power of science
final class Scientist: Character {
    init() {
        let name = "Scientist"
        let alias = "Conor"
        let startLife = 360
        let life = startLife
        let weaponGender = [Pistol(), Bow()]
        let weapon = weaponGender.first!
        let canHeal = true
        let abilities = "⚔️ or 💊 ▫️ Life : \(startLife) HP 🔹 Weapon available : Pistol, Bow"
        super.init(
            name: name,
            alias: alias,
            startLife: startLife,
            life: life,
            weaponGender: weaponGender,
            weapon: weapon,
            canHeal: canHeal,
            abilities: abilities
        )
    }
}
