//
//  Heros.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import Foundation
class Hero: MarvelCharacter {
    
    init() {
        super.init(name: "Marvel Hero", heroName: "Marvel Hero", image: nil, detailImage: nil, planet: nil, symbol: nil, createdBy: nil)
    }
    
    override init(name: String?, heroName: String?, image: String?, detailImage: String?, planet: String?, symbol: String?, createdBy: String?) {
        super.init(name: name, heroName: heroName, image: image, detailImage: detailImage, planet: planet, symbol: symbol, createdBy: createdBy)
    }
    
    
    static func listOfHeros() -> [Hero]{
        return [
            Hero(
                  name: "T'Challa",
                  heroName: "Black Panther",
                  image: "black_back",
                  detailImage: "black_detail",
                  planet: "Wakanda",
                symbol: "black_sy", createdBy: "Stan Lee"
            ),
            
            
            Hero(name: "Tony Stark",
                  heroName: "Iron Man",
                  image: "iron_back",
                  detailImage: "iron_detail",
                  planet: "Long Island",
                  symbol: "iron_sy", createdBy: "Stan Lee"
            ),
            
            
            Hero(name: "Steve Rogers",
                  heroName: "Capitan America",
                  image: "capitan_back",
                  detailImage: "capitan_detail",
                  planet: "Nueva York",
                  symbol: "capitan_sy", createdBy: "Joe Simon"
            ),
            
            
            Hero(name: "Groot",
                  heroName: "Groot",
                  image: "groot_back",
                  detailImage: "groot_detail",
                  planet: "Planeta X",
                  symbol: "guardians_sy", createdBy: "Jack Kirby"
            ),
            
            Hero(name: "Thor Odinson",
                  heroName: "Thor",
                  image: "thor_back",
                  detailImage: "thor_detail",
                  planet: "Asgard",
                  symbol: "thor_sy", createdBy: "Jack Kirby"),
            
            Hero(name: "Natasha Romanoff",
                  heroName: "Black Widow",
                  image: "widow_back",
                  detailImage: "widow_detail",
                  planet: "Rusia",
                  symbol: "widow_sy", createdBy: "Stan Lee"
            ),
            
            Hero(name: "Bruce Banner",
                  heroName: "Hulk",
                  image: "hulk_back",
                  detailImage: "hulk_detail",
                  planet: "Dayton",
                  symbol: "hulk_sy", createdBy: "Stan Lee"
            ),
            
            Hero(name: "Clint Barton",
                  heroName: "Hawkeye",
                  image: "hawkeye_back",
                  detailImage: "hawkeye_detail",
                  planet: "Waverly",
                  symbol: nil, createdBy: "Don Heck"
            ),
            
            
            Hero(name: "Wanda Maximoff",
                  heroName: "Scarlet Witch",
                  image: "witch_back",
                  detailImage: "witch_detail",
                  planet: "Sokovia",
                  symbol: "witch_sy", createdBy: "Jack Kirby"
            ),
            
            Hero(name: "James Rhode",
                  heroName: "War Machine",
                  image: "war_back",
                  detailImage: "war_detail",
                  planet: "Filadelfia",
                  symbol: nil, createdBy: "David Michelinie "
            
            ),
            
            Hero(name: "Scott Lang",
                  heroName: "Ant-Man",
                  image: "ant_back",
                  detailImage: "ant_detail",
                  planet: "Coral Gables",
                  symbol: "ant_sy", createdBy: "David Michelinie"
            ),
            
            Hero(name: "Sam Wilson",
                  heroName: "Falcon",
                  image: "falcon_back",
                  detailImage: "falcon_detail",
                  planet: "Harlem",
                  symbol: "falcon_sy", createdBy: "Gene Colan"
            ),
            
            Hero(name: "Stephen Strange",
                  heroName: "Dr. Strange",
                  image: "doctor_back",
                  detailImage: "doctor_detail",
                  planet: "Nueva York",
                  symbol: "doctor_sy", createdBy: "Steve Ditko"
            ),
            
            Hero(name: "Peter Parker",
                  heroName: "Spider-Man",
                  image: "spider_back",
                  detailImage: "spider_detail",
                  planet: "Forest Hills, Queens",
                  symbol: "spider_sy", createdBy: "Stan Lee"
            ),
            
            Hero(name: "Peter Quill",
                  heroName: "Star Lord",
                  image: "star_back",
                  detailImage: "star_detail",
                  planet: "St. Charles",
                  symbol: "guardians_sy", createdBy: "Steve Englehart"
            ),
            
            Hero(name: "Vision",
                  heroName: "Vision",
                  image: "vision_back",
                  detailImage: "vision_detail",
                  planet: "Tierra",
                  symbol: "vision_sy", createdBy: "Roy Thomas"
            ),
            
            Hero(name: "Carol Denvers",
                  heroName: "Capitana Marvel",
                  image: "capitana_back",
                  detailImage: "capitana_detail",
                  planet: "Cabo Cañaveral",
                  symbol: "capitana_sy", createdBy: "Roy Thomas"
            ),
            
            Hero(name: "Rocket Raccoon",
                  heroName: "Rocky Raccoon",
                  image: "raccoon_back",
                  detailImage: "raccoon_detail",
                  planet: "Keystone",
                  symbol: "guardians_sy", createdBy: "Bill Mantlo"
            )
        ]
    }
    
    
}
