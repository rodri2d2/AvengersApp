//
//  VillainsViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit

class VillainsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemBackground
       
    }

    // MARK: - Class functionalities
    private func setupViews(){
        setupTabBar()
//        setupNavigationBar()
//        setupCollectionView()
    }
    
    private func setupTabBar(){
        self.tabBarItem.title = "Indra"
    }
    
}
