//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Muhammet on 12.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameBirthday: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting işlemi ( as? - as! )
        
        
        if let newName = storedName as? String {
            nameLabel.text = "Name: \(newName)"
        }
        
        if let newBirthday = storedBirthday as? String {
            nameBirthday.text = "Birthday: \(newBirthday)"
        }
        
    }
    @IBAction func saveButton(_ sender: Any) {
        
        UserDefaults.standard.set(nameTextField.text!, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text!, forKey: "birthday")
        
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        nameBirthday.text = "Birthday: \(birthdayTextField.text!)"
        }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil {
           UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        
        
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            nameBirthday.text = "Birthday:"
        }
    }
    
}
    
    
    
    


