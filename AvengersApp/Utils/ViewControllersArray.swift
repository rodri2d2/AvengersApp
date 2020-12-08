//
//  ViewControllersArray.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit

struct ViewControllersArray {
    
    
    private var herosViewController: UINavigationController {
        let vc = UINavigationController(rootViewController: HerosViewController())
        vc.tabBarItem.title = "Avengers"
        vc.tabBarItem.image = UIImage(systemName: "person")
        return vc
    }

    private var villainsViewController: UINavigationController {
        let vc = UINavigationController(rootViewController: VillainsViewController())
        vc.tabBarItem.title = "Bad Guys"
        vc.tabBarItem.image = UIImage(systemName: "person.fill")
        return vc
    }
    
    /// Array of UIViewControllers
    /// Each ViewController that will be included in the main TabBar must be instantiated
    /// and than passed through this method
    /// - Returns: [UIViewController]
    func array() -> [UIViewController] {
        return [herosViewController, villainsViewController]
    }
    
}
