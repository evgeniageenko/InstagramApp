//
//  ImagePickerViewController.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 29.06.21.
//

import UIKit

class ImagePickerViewController: UIViewController {
    
    let pickerController = UIImagePickerController()

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        addButton.layer.borderWidth = 1.0
        addButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

        
    }
        

    @IBAction func oneTapRecognizer(_ sender: Any) {
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)

        print("add")
    }
}

extension ImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITabBarDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            photoImage.image = image
            
        }
        picker.dismiss(animated: true)
    }
    

}
