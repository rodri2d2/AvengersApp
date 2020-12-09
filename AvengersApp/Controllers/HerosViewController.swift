//
//  HerosViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit

class HerosViewController: UIViewController  {
    
    
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
 


    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
    }
    
    // MARK: - Class functionalities
    private func setupViews(){
        setupTabBar()
        setupNavigationBar()
        setupCollectionView()
    }
    
    private func setupTabBar(){
        self.tabBarController?.delegate = self
        self.tabBarController?.tabBar.tintColor = UIColor(named: "heros")
       
    }
    
    private func setupNavigationBar(){
        
        //
        self.navigationItem.title = "Avengers"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.barStyle = .black
    
        //
        let navBarStandarAppearance = UINavigationBarAppearance()
        navBarStandarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Futura-bold", size: 35)!
        ]
        
        let navBarScrollingAppearance = UINavigationBarAppearance()
        navBarScrollingAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "heros")!,
            .font: UIFont(name: "Futura-bold", size: 35)!
        ]
        
        let imageView = UIImageView(image: UIImage(named: "TabBar_Avengers"))
        self.navigationItem.titleView = imageView
        
        navBarScrollingAppearance.backgroundColor = .white
        

        self.navigationController?.navigationBar.standardAppearance = navBarStandarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarScrollingAppearance
        

    }

    private func setupCollectionView(){
        self.view.addSubview(collectionView)
        collectionView.pin(to: self.view)
        collectionView.backgroundColor = UIColor(named: "heros")
    }

}



// MARK: - Extension for UICollectionView DataSource
extension HerosViewController: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfHeros.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroCell.IDENTIFIER, for: indexPath) as? HeroCell else { return UICollectionViewCell()}
       
        
        let hero = listOfHeros[indexPath.row]
        cell.configure(cellWith: hero)
        
        return cell
    }
    
    
}


// MARK: - Extension for UICollectionView DelegateFlowLayout
extension HerosViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailController(), animated: true)
    }
    
    
}

// MARK: - Extension for UITabBarController Delegate
extension HerosViewController: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
