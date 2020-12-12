//
//  BeAHeroViewController.swift
//  AvengersApp
//
//  Created by Rodrigo Candido on 11/12/20.
//

import UIKit

class BeAHeroViewController: UIViewController {
    
    
    // MARK: - Properties
    var tryToAccept: Int = 0
    
    /// An array of ViewController to setup "automatically" a TabBar view with its items
   let viewControllers = ViewControllersArray()
    
    // MARK: - IBOutlets
    
    //Normal Views
    @IBOutlet private weak var backgroundView:  UIView!

    //Button Views
    @IBOutlet weak var acceptButton: UIButton!
    
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
        subscribeNotificationsForKeyboard()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        clearView()
        setupNavigationBar()
    }
    
    
    
    deinit {
        //Remove the notifications = stop listening for this events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification,         object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification,  object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification,     object: nil)
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
            acceptButton.isOpaque = false
            acceptButton.isUserInteractionEnabled = true
            showHideKeyboard(when: notification.name.rawValue, with: keyboardHeight)
        }
    }
    
    
    
    // MARK: - IBActions
    
    /// When users tap to accept all data entered manually this funcion will be called to do the first setup of a MarvelCharacter Object
    /// - Parameter sender: UIButton
    @IBAction func didBecomeAhero(_ sender: UIButton) {
        
        if (heroName.text == "" && tryToAccept >= 3) {
            let alert = UIAlertController(title: "Oops!Few steps missing...", message: "Enter HERO name!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if(!heroName.text!.isEmpty){
            createAHero()
        }
        
        tryToAccept += 1
    }
    
    
    
    /// When user change its type of hero, the color schemes changes too
    /// - Parameter sender: UISegmentedControl
    @IBAction func didChangeCharacter(_ sender: UISegmentedControl) {
        sender.selectedSegmentIndex == 0 ? setupViewColors(for: "hero") : setupViewColors(for: "enemy")
    }
    
    @IBAction func didTapImage(_ sender: Any) {
       
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
        
    }
    
    // MARK: - Class functionalities
    private func clearView(){
        self.heroName.text      = nil
        self.heroPlanet.text    = nil
        self.heroRealName.text  = nil
        self.heroActionImage.image = UIImage(systemName: "camera")
        self.heroDetailImage.image = UIImage(systemName: "camera")
        tryToAccept = 0 
    }
    
    
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
    
    
    private func createAHero(){
    

        
        let alias       = heroName.text!
        let realName    = heroRealName.text ?? " - "
        let planet      = heroPlanet.text   ?? " - "
        
        if(selectionItem.selectedSegmentIndex == 0){
            let newHero = Hero(name: realName, heroName: alias, image: nil, detailImage: nil, planet: planet, symbol: nil, createdBy: "\(realName) Coorp.")
            let navController = self.tabBarController!.viewControllers![0] as! UINavigationController
            let heroViewContoller = navController.topViewController as! HerosViewController
            heroViewContoller.listOfHeros.append(newHero)
            self.tabBarController?.selectedIndex = 0
            
            
        }else if (selectionItem.selectedSegmentIndex == 1) {
            let newEnemy = Enemy(name: realName, heroName: alias, image: nil, detailImage: nil, planet: planet, symbol: nil, createdBy: "\(realName) Coorp.")
            let navController = self.tabBarController!.viewControllers![2] as! UINavigationController
            let enemyViewController = navController.topViewController as! EnemyViewContoller
            enemyViewController.listOfEnemies.append(newEnemy)
            self.tabBarController?.selectedIndex = 2           
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
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return  }
        heroActionImage.image = image
        
    }
}



