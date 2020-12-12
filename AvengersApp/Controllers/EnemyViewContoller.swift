//
//  VillainsViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit

class EnemyViewContoller: UIViewController {

    // MARK: - Properties
    let listOfEnemies = Enemy.listOfEnemies()
    
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
    
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTabBar()
        setupNavigationBar()
    }
    
    
    // MARK: - Class functionalities
    private func setupViews(){
        setupCollectionView()
    }
    
    private func setupTabBar(){
//        self.tabBarController?.delegate = self
        self.tabBarController?.tabBar.tintColor = UIColor(named: "enemy_color")
        
    }
    
    private func setupNavigationBar(){
        
        //
        self.navigationItem.title = "Enimies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Futura-bold", size: 40)!
        ]
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                                        .font: UIFont(name: "Futura", size: 25)!
        ]
    }
    
    private func setupCollectionView(){
        self.view.addSubview(collectionView)
        collectionView.pin(to: self.view)
        collectionView.backgroundColor = UIColor(named: "enemy_color")
    }
    
}


// MARK: - Extension for UICollectionView DataSource
extension EnemyViewContoller: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfEnemies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCell.IDENTIFIER, for: indexPath) as? HeroCell else { return UICollectionViewCell()}
        
        let enemy = listOfEnemies[indexPath.row]
        cell.configure(cellWith: enemy)
        return cell
    }
    
}


// MARK: - Extension for UICollectionView DelegateFlowLayout
extension EnemyViewContoller: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let enemy = listOfEnemies[indexPath.row]
        navigationController?.pushViewController(DetailController(character: enemy), animated: true)
    }

}


