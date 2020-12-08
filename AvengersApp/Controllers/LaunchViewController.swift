//
//  ViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 25/11/20.
//

import UIKit

class LaunchViewController: UIViewController {

    
    
    // MARK: - Properties
   let viewControllers = ViewControllersArray()

    
    
    // MARK: - TabBar Configuration
    lazy var tabViewController: UITabBarController = { [weak self] in
        let tabView = UITabBarController()
        tabView.setViewControllers(viewControllers.array(), animated: true)
        tabView.modalTransitionStyle = .flipHorizontal
        tabView.modalPresentationStyle = .fullScreen
        return tabView

    }()
    
 
    // MARK: - Outlets
    private lazy var imageLogo: UIImageView = { [weak self] in
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupNavigationController()
        setupOutlets()
        animateLogo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.navigationController?.setViewControllers([self.tabViewController], animated: true)
        }
    }

    // MARK: - Class functionalities
    private func setupNavigationController(){
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupOutlets(){
        setupImageLogo()
    }
    
    private func setupImageLogo(){
        self.view.addSubview(imageLogo)
        imageLogo.center = view.center
        imageLogo.image = UIImage(named: "launch")
    }
    

    private func animateLogo(){
        UIView.animate(withDuration: 2) {
            let size = self.view.frame.size.width * 3
            let scaleX = size - (self.view.frame.size.width)
            let scaleY = (self.view.frame.size.height) - size
            
            self.imageLogo.frame = CGRect(x: -(scaleX/2), y: scaleY/2, width: size, height: size)
            self.imageLogo.alpha = 0
        }
    }

}

