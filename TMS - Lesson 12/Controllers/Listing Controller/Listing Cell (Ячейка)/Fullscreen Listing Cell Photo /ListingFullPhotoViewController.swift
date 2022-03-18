//
//  ListingFullPhotoViewController.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 20.06.21.
//

import UIKit

class ListingFullPhotoViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    
    let image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.image = image

    }
}
