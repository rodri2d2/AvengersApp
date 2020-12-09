//
//  Heros.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import Foundation
class Heros: MarvelCharacters {
    
    init() {
        super.init(name: "Marvel Hero", heroName: "Marvel Hero", image: nil, story: nil, planet: nil)
    }
    
    override init(name: String?, heroName: String?, image: String?, story: Story?, planet: String?) {
        super.init(name: name, heroName: heroName, image: image, story: story, planet: planet)
    }
    
    
    static func listOfHeros() -> [Heros]{
        return [
            Heros(name: "T'Challa",             heroName: "Black Panther",      image: "black_back",    story: .blackPanther, planet: "Earth"),
            Heros(name: "Tony Stark",           heroName: "Iron Man",           image: "iron_back",     story: .blackPanther, planet: "Earth"),
            Heros(name: "Steve Rogers",         heroName: "Capitan America",    image: "capitan_back",  story: .blackPanther, planet: "Earth"),
            Heros(name: "Groot",                heroName: "Groot",              image: "groot_back",    story: .blackPanther, planet: "Earth"),
            Heros(name: "Thor",                 heroName: "Thor",               image: "thor_back",     story: .blackPanther, planet: "Earth"),
            Heros(name: "Natasha Romanoff",     heroName: "Black Widow",        image: "widow_back",    story: .blackPanther, planet: "Earth"),
            Heros(name: "Bruce Banner",         heroName: "Hulk",               image: "hulk_back",     story: .blackPanther, planet: "Earth"),
            Heros(name: "Clint Barton",         heroName: "Hawkeye",            image: "hawkeye_back",  story: .blackPanther, planet: "Earth"),
            Heros(name: "Wanda Maximoff",       heroName: "Scarlet Witch",      image: "witch_back",    story: .blackPanther, planet: "Earth"),
            Heros(name: "James Rhode",          heroName: "War Machine",        image: "war_back",      story: .blackPanther, planet: "Earth"),
            Heros(name: "Scott Lang",           heroName: "Ant-Man",            image: "ant_back",      story: .blackPanther, planet: "Earth"),
            Heros(name: "Sam Wilson",           heroName: "Falcon",             image: "falcon_back",   story: .blackPanther, planet: "Earth"),
            Heros(name: "Stephen Strange",      heroName: "Dr. Strange",        image: "doctor_back",   story: .blackPanther, planet: "Earth"),
            Heros(name: "Peter Parker",         heroName: "Spider-Man",         image: "spider_back",   story: .blackPanther, planet: "Earth"),
            Heros(name: "Peter Quill",          heroName: "Star Lord",          image: "star_back",     story: .blackPanther, planet: "Earth"),
            Heros(name: "Vision",               heroName: "Vision",             image: "vision_back",   story: .blackPanther, planet: "Earth"),
            Heros(name: "Carol DEnvers",        heroName: "Capitana Marvel",    image: "capitana_back", story: .blackPanther, planet: "Earth"),
            Heros(name: "Raccoon",              heroName: "Raccoon",            image: "raccoon_back",  story: .blackPanther, planet: "Earth"),
            Heros(),

        ]
    }
    
    
}
