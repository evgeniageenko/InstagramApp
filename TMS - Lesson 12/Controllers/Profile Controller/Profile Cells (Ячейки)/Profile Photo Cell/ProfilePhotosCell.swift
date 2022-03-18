//
//  ProfilePhotosCell.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 14.06.21.
//

import UIKit

protocol ProfilePhotosCellDelegate: AnyObject {
    func savePhoto(photo: UIImage)
}

class ProfilePhotosCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSourse: [UIImage] = []
    
    var delegate: ProfilePhotosCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: PhotoCollectionViewCell.description(), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: PhotoCollectionViewCell.description())
    }
    
    
    
    func setupWith(photos: [UIImage]) {
        dataSourse = photos
        collectionView.reloadData()
        // релоайд дата обновляет методы делегата UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    }

    override class func description() -> String {
        return "ProfilePhotosCell"
    }

}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

extension ProfilePhotosCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.description(), for: indexPath) as! PhotoCollectionViewCell
        cell.setupWithModel(photo: dataSourse[indexPath.row])

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = dataSourse[indexPath.row]
        delegate?.savePhoto(photo: photo)
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    //указываем, сколько фоток будет в ряд 
        let size = collectionView.frame.width / 3
        return CGSize(width: size, height: size)
    }
    
    
}

