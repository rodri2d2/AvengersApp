//
//  DetailContrller.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 9/12/20.
//

import UIKit

class DetailController: UIViewController {

    // MARK: - Properties
    var marvelCharacter: MarvelCharacters?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var character: UILabel!
    @IBOutlet private weak var characterName: UILabel!
    @IBOutlet private weak var characterPlanet: UILabel!
    @IBOutlet private weak var characterImage: UIImageView!
    @IBOutlet private weak var createdBy: UILabel!
    
    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var symbolView: UIView!
    
    
    
    init(character: MarvelCharacters) {
        super.init(nibName: nil, bundle: nil)
        self.marvelCharacter = character
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let scrolling = UINavigationBarAppearance()
        scrolling.configureWithTransparentBackground()
        
        guard let character = marvelCharacter else { return  }
        configure(with: character)
        setupSybolView()
        
         
    }
    
    
    

    
    // MARK: - Class Functionalities
    private func configure(with character: MarvelCharacters) {
        self.character.text     = character.heroName
        self.characterName.text = character.name
        self.characterPlanet.text = character.planet
        self.characterImage.image = UIImage(named: character.detailImage!)
        self.createdBy.text = character.createdBy
        
        
        if (character.symbol == nil || character.symbol == ""){
            symbolImage.image = UIImage(named:"generic_sy")
        }else{
            self.symbolImage.image = UIImage(named: character.symbol!)
        }

    }


    private func setupSybolView(){

        symbolImage.layer.shadowColor = UIColor(named: "villain")?.cgColor
        symbolImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        symbolImage.layer.shadowOpacity = 0.8
        symbolImage.layer.shadowRadius = 5
    }

}
