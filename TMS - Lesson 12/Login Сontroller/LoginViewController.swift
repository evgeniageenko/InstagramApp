//
//  ViewController.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 7.06.21.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var logInNameTextField: UITextField!
    @IBOutlet weak var loginSurnameTextField: UITextField!
    @IBOutlet weak var saveLoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        // создание первой страницы через сториборт (когда не создается файл вместе с ксибом)
        
        if logInNameTextField.text?.isEmpty == false {
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let controller = storyBoard.instantiateViewController(withIdentifier: "ListingViewController") as? ListingViewController, logInNameTextField.text?.isEmpty == false else {
                logInNameTextField.layer.borderWidth = 1
                logInNameTextField.layer.borderColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                return
                
            }
            if let name = logInNameTextField.text {
                UserDefaults.standard.setValue(name, forKey: String.profileTitle)
            }
            
            
            
            if let name = logInNameTextField.text {
                UserDefaults.standard.setValue(name, forKey: String.profileTitle)
            }
            
            present(controller, animated: true, completion: {
                UserDefaults.standard.setValue(true, forKey: String.isUserLoggedIn)
                
            })
        }
    }
}



//UserDefaults - "Хранилище настроек": настройки звука, настройки цвета и прочее
//Keychain - для хранение "личных" данных: логин, пароль и прочее
