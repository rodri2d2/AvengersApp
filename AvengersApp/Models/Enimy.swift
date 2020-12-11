//
//  Enimies.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 10/12/20.
//

import Foundation
class Enimy: MarvelCharacter {
    
    init() {
        super.init(name: "Marvel Hero", heroName: "Marvel Hero", image: nil, detailImage: nil, planet: nil, symbol: nil, createdBy: nil)
    }
    
    override init(name: String?, heroName: String?, image: String?, detailImage: String?, planet: String?, symbol: String?, createdBy: String?) {
        super.init(name: name, heroName: heroName, image: image, detailImage: detailImage, planet: planet, symbol: symbol, createdBy: createdBy)
    }
    
    
    static func listOfEnimies() -> [Enimy]{
        return [
            Enimy(
                  name: "N'Jadaka",
                  heroName: "Killmonger",
                  image: "erik_back",
                  detailImage: "erik_detail",
                  planet: "Wakanda",
                  symbol: "erik_sy",
                  createdBy: "Don McGregor"
            ),
            
            
            Enimy(name: "Obadiah Stane",
                  heroName: "Iron Monger",
                  image: "obadiah_back",
                  detailImage: "obadiah_detail",
                  planet: "EEUU",
                  symbol: nil, createdBy: "Dennis O'Neil"
            ),
            
            
            Enimy(name: "Johann Schmidt",
                  heroName: "Red Skull",
                  image: "red_back",
                  detailImage: "red_detail",
                  planet: "Alemania",
                  symbol: "red_sy", createdBy: "Joe Simon"
            ),
            
            
            Enimy(name: "Thanos",
                  heroName: "Thanos The Titan",
                  image: "thanos_back",
                  detailImage: "thanos_detail",
                  planet: "Titán",
                  symbol: "thanos_sy", createdBy: "Jim Starlin"
            ),
            
            Enimy(name: "Ultron",
                  heroName: "Ultron",
                  image: "ultron_back",
                  detailImage: "ultron_detail",
                  planet: "Tierra",
                  symbol: nil, createdBy: "Roy Thomas"),
            
            Enimy(name: "Loki",
                  heroName: "Loki",
                  image: "loki_back",
                  detailImage: "loki_detail",
                  planet: "Asgard",
                  symbol: "loki_sy", createdBy: "Jack Kirby"
            ),
            
            Enimy(name: "Emil Blönsky",
                  heroName: "Abomination",
                  image: "abomination_back",
                  detailImage: "abomination_detail",
                  planet: "Yugoslavia",
                  symbol: nil, createdBy: "Stan Lee"
            ),
            
            Enimy(name: "Joe Crocker",
                  heroName: "Kaecilius",
                  image: "kaecilius_back",
                  detailImage: "kaecilius_detail",
                  planet: " - ",
                  symbol: nil, createdBy: "Steve Ditko"
            )
        ]
    }
    
    
}
