//
//  MarvelCharacters.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import Foundation


class MarvelCharacters {
    
    var heroName: String?
    var name:     String?
    var image:    String?
    var planet:   String?
    var story:    Story?
    

    init(name: String?, heroName: String?, image: String?, story: Story?, planet: String?) {
        self.name       = name
        self.heroName   = heroName
        self.image      = image
        self.story      = story
        self.planet     = planet
    }
    
}
