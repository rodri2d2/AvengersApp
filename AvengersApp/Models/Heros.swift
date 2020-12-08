//
//  Heros.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import Foundation
class Heros: MarvelCharacters {
    
    init() {
        super.init(name: "", heroName: "", image: "")
    }
    
    override init(name: String, heroName: String, image: String) {
        super.init(name: name, heroName: heroName, image: image)
    }
    
    
    static func listOfHeros() -> [Heros]{
        return [
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: ""),
            Heros(name: "No se", heroName: "Capitan America", image: "")
        ]
    }
    
    
}
