//
//  HerosViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit

class HerosViewController: UIViewController {
    
    
    // MARK: - Properties
    let listOfHeros = Heros.listOfHeros()

    
    // MARK: - Views
    lazy var collectionView: UICollectionView = { [weak self] in
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "HeroCell", bundle: nil), forCellWithReuseIdentifier: HeroCell.IDENTIFIER)
        collectionView.dataSource = self
        collectionView.delegate   = self
        return collectionView
        
    }()

    let collectionViewBackground : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named:"nav_bar")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
  
        setupViews()

    }
    
    
    // MARK: - Class functionalities
    private func setupViews(){
        setupTabBar()
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupTabBar(){
        self.tabBarItem.title = "Avengers"
    }
    
    private func setupNavigationBar(){
        
        //
        self.navigationItem.title = "Avengers"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
    
        //
        let navBarStandarAppearance = UINavigationBarAppearance()
        navBarStandarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Futura-bold", size: 35)!
        ]

        navBarStandarAppearance.backgroundImage = UIImage(named: "nav_bar")
        navBarStandarAppearance.shadowColor = .purple

        let navBarScrollingAppearance = UINavigationBarAppearance()
        navBarScrollingAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.purple,
            .font: UIFont(name: "Futura-bold", size: 35)!
        ]
        navBarScrollingAppearance.backgroundColor = .white
        navBarScrollingAppearance.shadowColor = .black
       
        
        self.navigationController?.navigationBar.standardAppearance = navBarStandarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarScrollingAppearance
        

    }

    private func setupCollectionView(){
        self.view.addSubview(collectionView)
        collectionView.pin(to: self.view)
       

    }

}



// MARK: - Extension for UICollectionView DataSource
extension HerosViewController: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfHeros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCell.IDENTIFIER, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    
}


// MARK: - Extension for UICollectionView DelegateFlowLayout
extension HerosViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 200)
    }
    
    
}
