//
//  Ext+UIViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 10/12/20.
//


import UIKit
extension UIViewController {
    func setTitle(_ title: String, andImage image: UIImage) {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        let titleLbl = UILabel()
        let titleView = UIStackView(arrangedSubviews: [imageView, titleLbl])
        
        titleLbl.text = title
        titleLbl.textColor = UIColor.white
        titleLbl.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        titleView.axis = .horizontal
        titleView.spacing = 10.0
        navigationItem.titleView = titleView
        
        
    }
}
