//
//  ProfileMainInfoCellTableViewCell.swift
//  TMS - Lesson 12
//
//  Created by Евгений Агеенко on 10.06.21.
//

import UIKit


protocol ProfileCellDelegate: AnyObject {
    func editProfile()
}

struct ProfileMainInfoCellModel {
    let profileIamge: UIImage
    let nameString: String
    let interestsString: String
    let adressLabel: String
    let followersCount: String
    let followingCount: String
    let postsCount: String
    
}

class ProfileMainInfoCell: UITableViewCell {
    
     weak var delegate: ProfileCellDelegate?
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var nameString: UILabel!
    @IBOutlet private weak var postsCountLabel: UILabel!
    @IBOutlet private weak var postsLabel: UILabel!
    @IBOutlet private weak var followersCountLabel: UILabel!
    @IBOutlet private weak var followersLabel: UILabel!
    @IBOutlet private weak var followingCountLabel: UILabel!
    @IBOutlet private weak var followingLabel: UILabel!
    @IBOutlet private weak var interestsLabel: UILabel!
    @IBOutlet private weak var adressLabel: UILabel!
    @IBOutlet private weak var editProfileButton: UIButton!
    
    //тоже самое, что и viewDidload() - почти тоже самое что и наша функция setupWithModel
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //    }
    
    //  присваивание аутлетам значения
    func setupWithModel(model: ProfileMainInfoCellModel) {
        profileImage.image = model.profileIamge
        nameString.text = model.nameString
        interestsLabel.text = model.interestsString
        adressLabel.text = model.adressLabel
        followersCountLabel.text = model.followersCount
        followingCountLabel.text = model.followingCount
        postsCountLabel.text = model.postsCount
        
        
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        editProfileButton.layer.borderWidth = 1.0
        editProfileButton.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    
    override class func description() -> String {
        return "ProfileMainInfoCell"
    }
    
    
    @IBAction func edditButton(_ sender: Any) {
        delegate?.editProfile()
    }
}

