//
//  DetailsVC.swift
//  ArtBookProject
//
//  Created by Muhammet on 7.06.2024.
//

import UIKit
import CoreData

class DetailsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var artistText: UITextField!
    @IBOutlet weak var yearText: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    var chosenPainting = ""
    var chosenPaintingId : UUID?
    

    override func viewDidLoad() {
        
        if chosenPainting != "" {
            
            saveButton.isHidden = true
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Paintings")
            let idString = chosenPaintingId?.uuidString
            fetchRequest.predicate = NSPredicate(format: "id = %@", idString!)
            fetchRequest.returnsObjectsAsFaults = false
            
            do {
                let results = try context.fetch(fetchRequest)
                    
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        
                        if let name = result.value(forKey: "name") as? String {
                            nameText.text = name
                        }
                        
                        if let artist = result.value(forKey: "artist") as? String {
                            artistText.text = artist
                        }
                        
                        if let year = result.value(forKey:"year") as? Int {
                            yearText.text = String(year)
                        }
                        
                        if let imageData = result.value(forKey: "image") as? Data {
                            let image = UIImage(data: imageData)
                            imageView.image = image
                        }
                        
                    }
                }
                
            } catch {
                
            }
            
            
            
            
        }else {
            saveButton.isHidden = false
            saveButton.isEnabled = false
            nameText.text = ""
            artistText.text = ""
            yearText.text = ""
            
        }
        
        
        
        
        
        super.viewDidLoad()
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(gestureRecognizer)
        
        imageView.isUserInteractionEnabled = true
        let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(imageTapGestureRecognizer)
        
    }
    
    @objc func selectImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary  // Görseli nereden alsın? camera or library?
        picker.allowsEditing = true // Kullanıcı seçtiği görseli editleyebilsin mi? zoom crop vs.
        present(picker, animated: true, completion: nil)
        print("Tıklandı")
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        saveButton.isEnabled = true
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
   
    
    @IBAction func saveButtonClicked(_ sender: Any) {
        
        print("Çalıştı")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPaintings = NSEntityDescription.insertNewObject(forEntityName: "Paintings", into: context)
        
         // Attributes
        
        newPaintings.setValue(nameText.text!, forKey:"name")
        newPaintings.setValue(artistText.text!, forKey: "artist")
        
        if let year = Int(yearText.text!) {
            newPaintings.setValue(year, forKey: "year")
        }else {
            print("Year is not a valid number")
        }
        
        let data = imageView.image!.jpegData(compressionQuality: 0.5)
        newPaintings.setValue(data, forKey: "image")
        
        newPaintings.setValue(UUID(), forKey: "id")
        
       
        do{
            try context.save()
            print("succes")
        } catch {
            print("saving error 55")
        }
         
        
        NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil) // VC'ler arası haberleşmeyi sağlayan yapı.
                                                                                            // getData fonksiyonunu bunun içerisinde kullancağım..
        
        navigationController?.popViewController(animated: true) // Bir önceki sayfaya dönmeye yarayan fonksiyon.
    }
    
    
}
