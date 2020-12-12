//
//  MainViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit

class MainViewController: UIViewController {
    
    
    // MARK: - Properties
   let viewControllers = ViewControllersArray()

    // MARK: - Outlets
    private lazy var tabViewController: UITabBarController = {
        let tabView = UITabBarController()
        tabView.setViewControllers(viewControllers.array(), animated: true)
        tabView.modalPresentationStyle = .fullScreen
        return tabView

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    
        self.navigationController?.pushViewController(tabViewController, animated: true)
        
    }
    
    

    
}
