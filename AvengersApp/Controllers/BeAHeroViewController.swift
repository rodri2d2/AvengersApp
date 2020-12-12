//
//  BeAHeroViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 11/12/20.
//

import UIKit

class BeAHeroViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    //Normal Views
    @IBOutlet private weak var backgroundView:  UIView!
    @IBOutlet private weak var acceptButton:    UIView!
    
    //Segment Control View
    @IBOutlet private weak var selectionItem:   UISegmentedControl!
    
    //Image Views
    @IBOutlet private weak var heroActionImage: UIImageView!
    @IBOutlet private weak var heroDetailImage: UIImageView!

    //TextField Views
    @IBOutlet private weak var heroName:        UITextField!
    @IBOutlet private weak var heroRealName:    UITextField!
    @IBOutlet private weak var heroPlanet:      UITextField!
    
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        setupTapGesture()
        setupTextViews()
        subscribeNotificationsForKeyboardsubscribeNotificationsForKeyboard()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    
    deinit {
        //Remove the notifications = stop listening for this events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    // MARK: - Notification Subscribers
    private func subscribeNotificationsForKeyboard(){
        //Suscribe for keyboard will show
        NotificationCenter.default.addObserver(self, selector: #selector(onChangeKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //Suscribe for keyboard will be hide
        NotificationCenter.default.addObserver(self, selector: #selector(onChangeKeyboard(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Suscribe for keyboard will change frame (its sizes)
        NotificationCenter.default.addObserver(self, selector: #selector(onChangeKeyboard(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
 
    }
    
    
    // MARK: - Notifications Receivers
    @objc func onChangeKeyboard(notification: Notification){
        
        guard let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        //Before trigger the keyboard, check which text field is being used
        if !heroName.isEditing{
            showHideKeyboard(when: notification.name.rawValue, with: keyboardHeight)
        }
    }
    
    
    
    // MARK: - IBActions
    
    /// When users tap to accept all data entered manually this funcion will be called to do the first setup of a MarvelCharacter Object
    /// - Parameter sender: UIButton
    @IBAction func didBecomeAhero(_ sender: UIButton) {
        
        print("click")
        
    }
    
    
    
    /// When user change its type of hero, the color schemes changes too
    /// - Parameter sender: UISegmentedControl
    @IBAction func didChangeCharacter(_ sender: UISegmentedControl) {
        sender.selectedSegmentIndex == 0 ? setupViewColors(for: "hero") : setupViewColors(for: "enemy")
    }
    
    
    // MARK: - Class functionalities
    private func showHideKeyboard(when notificate: String, with height: CGFloat){
        
        switch notificate {
            case UIResponder.keyboardWillShowNotification.rawValue,
                 UIResponder.keyboardWillChangeFrameNotification.rawValue:
                self.view.frame.origin.y = -(height - 30)
            case UIResponder.keyboardWillHideNotification.rawValue:
                self.view.frame.origin.y = 0
            default:
                return
        }
    }
    
    
    /// Configure a Tap Gesture on the main view to asure thar keyboar will resign in any case
    private func setupTapGesture(){
        //
        let tap = UITapGestureRecognizer(target: self, action: #selector(didDismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func didDismissKeyboard(){
        //
        view.endEditing(true)
    }
    
    private func setupNavigationBar(){
        
        //
        self.navigationItem.title = "Become a Hero"
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white,
                                                                        .font: UIFont(name: "Futura", size: 25)!
        ]
    }
    
    
    private func setupTextViews(){
        
        //Hero Name TextField
        self.heroName.delegate      = self
        self.heroName.returnKeyType     = .done
        self.heroName.attributedPlaceholder = NSAttributedString(string: "Enter you Hero name",attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
          
        //Hero Real Name TextField
        self.heroRealName.delegate  = self
        self.heroRealName.returnKeyType = .done
        self.heroRealName.attributedPlaceholder = NSAttributedString(string: "Enter your Real name",                                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "enemy_color")!])

        //Hero Planet TextField
        self.heroPlanet.delegate    = self
        self.heroPlanet.returnKeyType   = .done
        self.heroPlanet.attributedPlaceholder = NSAttributedString(string: "Enter your Planet name",
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "enemy_color")!])
    }
    
    
    private func setupViewColors(for character: String){
        if character == "hero" {
            self.backgroundView.backgroundColor = UIColor(named: "hero_color")
            self.acceptButton.backgroundColor = UIColor(named: "enemy_color")
        } else if character == "enemy"{
            self.backgroundView.backgroundColor = UIColor(named: "enemy_color")
            self.acceptButton.backgroundColor = UIColor(named: "hero_color")
        }
        
    }
    
}


// MARK: - Extension for UITextFieldDelegate
extension BeAHeroViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



// MARK: - Extension for UIPicker
extension BeAHeroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    }
}



