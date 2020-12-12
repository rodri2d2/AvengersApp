//
//  Enimies.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 10/12/20.
//

import Foundation
class Enemy: MarvelCharacter {
    
    init() {
        super.init(name: "Marvel Hero", heroName: "Marvel Hero", image: nil, detailImage: nil, planet: nil, symbol: nil, createdBy: nil)
    }
    
    override init(name: String?, heroName: String?, image: String?, detailImage: String?, planet: String?, symbol: String?, createdBy: String?) {
        super.init(name: name, heroName: heroName, image: image, detailImage: detailImage, planet: planet, symbol: symbol, createdBy: createdBy)
    }
    
    
    static func listOfEnemies() -> [Enemy]{
        return [
            Enemy(
                  name: "N'Jadaka",
                  heroName: "Killmonger",
                  image: "erik_back",
                  detailImage: "erik_detail",
                  planet: "Wakanda",
                  symbol: "erik_sy",
                  createdBy: "Don McGregor"
            ),
            
            
            Enemy(name: "Obadiah Stane",
                  heroName: "Iron Monger",
                  image: "obadiah_back",
                  detailImage: "obadiah_detail",
                  planet: "EEUU",
                  symbol: nil, createdBy: "Dennis O'Neil"
            ),
            
            
            Enemy(name: "Johann Schmidt",
                  heroName: "Red Skull",
                  image: "red_back",
                  detailImage: "red_detail",
                  planet: "Alemania",
                  symbol: "red_sy", createdBy: "Joe Simon"
            ),
            
            
            Enemy(name: "Thanos",
                  heroName: "Thanos The Titan",
                  image: "thanos_back",
                  detailImage: "thanos_detail",
                  planet: "Titán",
                  symbol: "thanos_sy", createdBy: "Jim Starlin"
            ),
            
            Enemy(name: "Ultron",
                  heroName: "Ultron",
                  image: "ultron_back",
                  detailImage: "ultron_detail",
                  planet: "Tierra",
                  symbol: nil, createdBy: "Roy Thomas"),
            
            Enemy(name: "Loki",
                  heroName: "Loki",
                  image: "loki_back",
                  detailImage: "loki_detail",
                  planet: "Asgard",
                  symbol: "loki_sy", createdBy: "Jack Kirby"
            ),
            
            Enemy(name: "Emil Blönsky",
                  heroName: "Abomination",
                  image: "abomination_back",
                  detailImage: "abomination_detail",
                  planet: "Yugoslavia",
                  symbol: nil, createdBy: "Stan Lee"
            ),
            
            Enemy(name: "Joe Crocker",
                  heroName: "Kaecilius",
                  image: "kaecilius_back",
                  detailImage: "kaecilius_detail",
                  planet: " - ",
                  symbol: nil, createdBy: "Steve Ditko"
            )
        ]
    }
    
    
}
