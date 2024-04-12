//
//  ViewController.swift
//  Segue,PerformSegue
//
//  Created by Muhammet on 12.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    var username = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextClicked(_ sender: Any) {
        
        username = nameTextField.text!
        performSegue(withIdentifier: "toSecond", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let nameVeri = segue.destination as! SeconViewController
            nameVeri.myName = username
        
        }
    }
    
    
}

