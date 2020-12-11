//
//  MarvelCharacters.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import Foundation


class MarvelCharacter {
    
    var heroName:       String?
    var name:           String?
    var image:          String?
    var detailImage:    String?
    var planet:         String?
    var symbol:         String?
    var createdBy:      String?

    

    init(name: String?, heroName: String?, image: String?, detailImage: String?, planet: String?, symbol: String?, createdBy:      String?) {
        self.name           = name
        self.heroName       = heroName
        self.image          = image
        self.planet         = planet
        self.detailImage    = detailImage
        self.symbol         = symbol
        self.createdBy      = createdBy
    }
    
}
