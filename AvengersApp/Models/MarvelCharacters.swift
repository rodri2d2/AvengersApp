//
//  MarvelCharacters.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import Foundation


class MarvelCharacters {
    
    var heroName: String!
    var name:     String!
    var image:    String?

    init(name: String, heroName: String, image: String) {
        self.name = name
        self.heroName = heroName
        self.image = image
    }
    
}
