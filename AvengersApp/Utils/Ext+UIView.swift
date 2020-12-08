//
//  Ext+UIView.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 8/12/20.
//

import UIKit


/**
 
    This extension implements custom functionalities to UIView Class
 
 
 */
extension UIView {
    
    
    
    /**
     PIN a view to its super - Use this function to pin a view when this ocupies the entire Screen space of its super
     - Parameter superView: Its main or super container view to be pinned in
     
     ## Example
     
     Being at some ViewController or a Class that has a implementation of UIView, send this view property as parameter
     ~~~
     class ViewController: UIViewController {
         override func viewDidLoad() {
            super.viewDidLoad()
            tableView.pin(to: self.view)
         }
     }
     ~~~
     
     */
    func pin(to superView: UIView){
        
        if let _ = superview {
            translatesAutoresizingMaskIntoConstraints                               = false
            topAnchor.constraint(equalTo: superview!.topAnchor).isActive            = true
            leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive    = true
            trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive  = true
            bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive      = true
        }
    }
    
    
    func centerTo(superView: UIView, with width: CGFloat, and height: CGFloat){
        
        if let _ = superview {
            translatesAutoresizingMaskIntoConstraints                               = false
            heightAnchor.constraint(equalToConstant: height).isActive               = true
            widthAnchor.constraint(equalToConstant: width).isActive                 = true
            centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive    = true
            centerYAnchor.constraint(equalTo: superview!.centerYAnchor).isActive    = true
        }
    }
}
