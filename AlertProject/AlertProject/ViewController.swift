//
//  ViewController.swift
//  AlertProject
//
//  Created by Muhammet on 13.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func signupClicked(_ sender: Any) {
        
        /*   print("Giriş Denendi")
         let alert = UIAlertController(title: "Error!", message: "Username not found !", preferredStyle: UIAlertController.Style.alert)
         let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { UIAlertAction in
         print("Hata - Geri Çıkıldı")
         }
         alert.addAction(okButton)
         self.present(alert, animated: true, completion: nil)        */
        
        
        if usernameText.text == "" {
           makeAlert(titleInput: "Error", message: "Username not found")
            
        } else if passwordText.text == "" {
            makeAlert(titleInput: "Error", message: "Password not found")
            
        } else if passwordText.text != password2Text.text {
            makeAlert(titleInput: "Error", message: "Passwords do not match")
            
        } else {
          makeAlert(titleInput: "Succes", message: "User OK")
        }
        
    }
  
    func makeAlert(titleInput:String,message:String){
        let alert = UIAlertController(title: titleInput, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true,completion: nil)
    }
    
    
}
