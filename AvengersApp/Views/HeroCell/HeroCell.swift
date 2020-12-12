//
//  HeroCell.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit

class HeroCell: UICollectionViewCell {
    
    
    static let IDENTIFIER = "HeroCell"

    // MARK: - IBOutlets
    @IBOutlet private weak var heroCardImage: UIImageView!
    @IBOutlet private weak var heroCardName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        self.heroCardImage.image = nil
        self.heroCardName.text   = nil
    }
    
    // MARK: - Class functionalities
    func configure(cellWith hero: MarvelCharacter
    ){
        self.heroCardImage.image    = UIImage(named: hero.image ?? "nav_bar")
        self.heroCardName.text      = hero.heroName
    }
}
