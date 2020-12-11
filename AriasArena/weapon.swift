//
//  weapon.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation
// Class to define Weapon models
class Weapon {
    var name: String
    var gender: String
    var damage: Int
    var care: Int
    init(name: String, gender: String, damage: Int, care: Int) {
        self.name = name
        self.gender = gender
        self.damage = damage
        self.care = care
    }
}

// Starting game weapon : Stick
class Stick: Weapon {
    init() {
        let name = "Shepherd's crook"
        let gender = "Stick"
        let damage = 90
        let care = 60
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Stick
class Gridarvol: Stick {
    override init() {
        super.init()
        self.name = "Gridarvol"
        self.gender = "Stick"
        self.damage = 110
        self.care = 80
    }
}
// When character loot a Bad Stick
class PieceOfWood: Stick {
    override init() {
        super.init()
        self.name = "Piece of Wood"
        self.gender = "Stick"
        self.damage = 45
        self.care = 30
    }
}
// Starting game weapon : Crossbow
class Crossbow: Weapon {
    init() {
        let name = "Tsangra"
        let gender = "Crossbow"
        let damage = 115
        let care = 80
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Crossbow
class Chanon: Crossbow {
    override init() {
        super.init()
        self.name = "Chanon Bolter"
        self.gender = "Crossbow"
        self.damage = 130
        self.care = 90
    }
}
// When character loot a Bad Crossbow
class Medieval: Crossbow {
    override init() {
        super.init()
        self.name = "Medieval Crossbow"
        self.gender = "Crossbow"
        self.damage = 55
        self.care = 40
    }
}
// Starting game weapon : Axe
class Axe: Weapon {
    init() {
        let name = "Bardiche"
        let gender = "Axe"
        let damage = 125
        let care = 90
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Axe
class Shadowmourne: Axe {
    override init() {
        super.init()
        self.name = "Shadowmourne"
        self.gender = "Axe"
        self.damage = 55
        self.care = 40
    }
}
// When character loot a Bad Axe
class Woodsman: Axe {
    override init() {
        super.init()
        self.name = "Woodsman Axe"
        self.gender = "Axe"
        self.damage = 55
        self.care = 40
    }
}

// Starting game weapon : Dagger
class Dagger: Weapon {
    init() {
        let name = "Medieval dagger"
        let gender = "Dagger"
        let damage = 95
        let care = 40
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Dagger
class FangsFather: Dagger {
    override init() {
        super.init()
        self.name = "Fangs of the Father"
        self.gender = "Dagger"
        self.damage = 55
        self.care = 40
    }
}
// When character loot a Bad Dagger
class PlasticDagger: Dagger {
    override init() {
        super.init()
        self.name = "Plastic Dagger"
        self.gender = "Dagger"
        self.damage = 55
        self.care = 40
    }
}
// Starting game weapon : Pistol
class Pistol: Weapon {
    init() {
        let name = "Higgins"
        let gender = "Pistol"
        let damage = 110
        let care = 75
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Pistol
class BonnieClyde: Pistol {
    override init() {
        super.init()
        self.name = "Bonnie & Clyde"
        self.gender = "Pistol"
        self.damage = 55
        self.care = 40
    }
}
// When character loot a Bad Pistol
class WaterPistol: Pistol {
    override init() {
        super.init()
        self.name = "Water Pistol"
        self.gender = "Pistol"
        self.damage = 55
        self.care = 40
    }
}
// Starting game weapon : Bow
class Bow: Weapon {
    init() {
        let name = "Meerk"
        let gender = "Bow"
        let damage = 100
        let care = 50
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Bow
class Artemis: Bow {
    override init() {
        super.init()
        self.name = "Artemis Bow"
        self.gender = "Bow"
        self.damage = 55
        self.care = 40
    }
}
// When character loot a Bad Bow
class PracticeBow: Bow {
    override init() {
        super.init()
        self.name = "Practice Bow"
        self.gender = "Bow"
        self.damage = 55
        self.care = 40
    }
}
// Starting game weapon : Sword
class Sword: Weapon {
    init() {
        let name = "Damo"
        let gender = "Sword"
        let damage = 120
        let care = 80
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Sword
class Anduril: Sword {
    override init() {
        super.init()
        self.name = "Anduril"
        self.gender = "Sword"
        self.damage = 55
        self.care = 40
    }
}
// When character loot a Bad Sword
class Penknife: Sword {
    override init() {
        super.init()
        self.name = "Penknife"
        self.gender = "Sword"
        self.damage = 55
        self.care = 40
    }
}
// Starting game weapon : Hammer
class Hammer: Weapon {
    init() {
        let name = "Warhammer"
        let gender = "Hammer"
        let damage = 130
        let care = 95
        super.init(name: name, gender: gender, damage: damage, care: care)
    }
}
// When character loot a Best Hammer
class Mjollnir: Hammer {
    override init() {
        super.init()
        self.name = "Mjöllnir"
        self.gender = "Hammer"
        self.damage = 55
        self.care = 40
    }
}
// When character loot a Bad Hammer
class Mallet: Hammer {
    override init() {
        super.init()
        self.name = "Mallet"
        self.gender = "Hammer"
        self.damage = 55
        self.care = 40
    }
}
