//
//  PhotoCollectionViewCell.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 14.06.21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!

    func setupWithModel(photo: UIImage) {
        photoImageView.image = photo
        
        
        photoImageView.layer.borderWidth = 1
        photoImageView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    override class func description() -> String {
        return "PhotoCollectionViewCell"
    }
}

