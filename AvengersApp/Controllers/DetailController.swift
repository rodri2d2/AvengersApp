//
//  DetailContrller.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 9/12/20.
//

import UIKit

class DetailController: UIViewController {

    // MARK: - Properties
    var marvelCharacter: MarvelCharacter?
    
    // MARK: - IBOutlets
    @IBOutlet private weak var character:       UILabel!
    @IBOutlet private weak var characterName:   UILabel!
    @IBOutlet private weak var characterPlanet: UILabel!
    @IBOutlet private weak var characterImage:  UIImageView!
    @IBOutlet private weak var createdBy:       UILabel!
    @IBOutlet private weak var symbolImage:             UIImageView!
    @IBOutlet private weak var symbolView:              UIView!
    
    
    @IBOutlet private weak var heroNameView:        UIView!
    @IBOutlet private weak var heroBackgroundView:   UIView!
    
    init(character: MarvelCharacter) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkCharactersType();
    }
    
    // MARK: - Class Functionalities
    private func checkCharactersType(){
        switch  marvelCharacter{
            case is Hero:
                configureViewColors(nameColor: "enimy_color", and: "hero_color")
            case is Enimy:
                configureViewColors(nameColor: "hero_color", and: "enimy_color")
            default:
                configureViewColors(nameColor: "enimy_color", and: "hero_color")
        }
    }
    
    private func configureViewColors(nameColor: String, and backgroundColor: String){
        self.heroNameView.backgroundColor = UIColor(named: nameColor)
        self.heroBackgroundView.backgroundColor = UIColor(named: backgroundColor)
    }
    
    private func configure(with character: MarvelCharacter) {
        
        self.character.text     = character.heroName
        self.characterName.text = character.name
        self.characterPlanet.text = character.planet
        self.characterImage.image = UIImage(named: character.detailImage!)
        self.createdBy.text = character.createdBy

        if (character is Hero){
            if(character.symbol == nil || character.symbol == "") {
                symbolImage.image = UIImage(named:"generic_sy")
            }else{
                self.symbolImage.image = UIImage(named: character.symbol!)
            }
        } else if(character is Enimy){
            if(character.symbol == nil || character.symbol == "") {
                symbolImage.image = UIImage(named:"TabBar_Thanos")
            }else{
                self.symbolImage.image = UIImage(named: character.symbol!)
            }
        }
   
    }
 
    private func setupSybolView(){

        symbolImage.layer.shadowColor = UIColor.black.cgColor
        symbolImage.layer.shadowOffset = CGSize(width: 3, height: 3)
        symbolImage.layer.shadowOpacity = 0.8
        symbolImage.layer.shadowRadius = 5
    }

}
