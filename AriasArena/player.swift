//
//  player.swift
//  AriasArena
//
//  Created by Johann Ulma on 21/10/2020.
//

import Foundation

// Class Player
class Player {
    let name: String
    var play: Bool
    let composition: [Character]
    init(name: String, play: Bool, composition: [Character]) {
        self.name = name
        self.play = play
        self.composition = composition
    }

    func playing() {
        if play == true {
            playing()
        } else {
            print("Next player")
        }

    }

    func choice() {
    }
}

/** class PlayerOne: Player {
    init() {
        if let name = readLine() {
            print(name)
        }
        let play = true
        let composition = [Character.self]
        super.init(name: name, play: play, composition: composition)
        
    }
}

class PlayerTwo: Player {
    init() {
        if let name = readLine() {
            print(name)
        }
        let play = true
        let composition = [Character.self]
        super.init(name: name, play: play, composition: composition)
        
    }
}


 */
