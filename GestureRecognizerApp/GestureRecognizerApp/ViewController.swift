//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Muhammet on 13.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var isImpala = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true  //Kullanıcı görsele butonmuş gibi tıklayabilsin.
        
        let gesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(picChanger))
        imageView.addGestureRecognizer(gesterRecognizer)
    }
    
    @objc func picChanger(){
       
        if isImpala == true {
            imageView.image = UIImage(named: "impala")
            myLabel.text = "Tame Impala"
            isImpala = false
        }else {
            imageView.image = UIImage(named: "weeknd")
            myLabel.text = "The Weeknd"
            isImpala = true
        }
        
        
        
        
        
    }


}

