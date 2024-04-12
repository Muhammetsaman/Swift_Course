//
//  SeconViewController.swift
//  Segue,PerformSegue
//
//  Created by Muhammet on 12.04.2024.
//

import UIKit

class SeconViewController: UIViewController {
 @IBOutlet weak var myLabel: UILabel!
    
    var myName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.text = myName
     
        
    }
    


}
